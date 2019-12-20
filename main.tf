
provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/rds"
}

resource "alicloud_db_instance" "db_instance" {
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  instance_name        = var.instance_name
  zone_id              = var.zone_id != "" ? var.zone_id : data.alicloud_vswitches.this.vswitches.0.zone_id
  period               = var.period
  security_ips         = var.security_ips
  count                = var.new_instance ? 1 : 0
  vswitch_id           = var.vswitch_id != "" ? var.vswitch_id : data.alicloud_vswitches.this.ids[count.index]

}
resource "alicloud_db_backup_policy" "db_backup_policy" {
  instance_id          = alicloud_db_instance.db_instance.0.id
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  retention_period     = var.retention_period
  log_backup           = var.log_backup
  log_retention_period = var.log_retention_period
  count                = var.new_backup_policy ? 1 : 0


}
resource "alicloud_db_database" "db_database" {
  instance_id   = alicloud_db_instance.db_instance.0.id
  name          = lookup(var.database_list[count.index], "db_name")
  character_set = lookup(var.database_list[count.index], "db_character_set")
  description   = lookup(var.database_list[count.index], "db_description")
  count         = var.new_database ? length(var.database_list) : 0
}
resource "alicloud_db_account" "db_database_account" {
  instance_id = alicloud_db_instance.db_instance.0.id
  name        = var.account_name
  password    = var.password
  type        = var.type
  count       = var.new_account ? 1 : 0

}

resource "alicloud_db_account_privilege" "db_account_privilege" {
  instance_id  = alicloud_db_account.db_database_account.0.instance_id
  account_name = alicloud_db_account.db_database_account.0.name
  db_names     = alicloud_db_database.db_database.*.name
  privilege    = var.privilege
  count        = var.new_privilege ? 1 : 0

}

resource "alicloud_db_readonly_instance" "db_readonly_instance" {
  master_db_instance_id = alicloud_db_instance.db_instance.0.id
  instance_name         = alicloud_db_instance.db_instance.0.instance_name
  count                 = var.new_db_readonly_instance ? 1 : 0
  zone_id               = var.readonly_zone_id
  engine_version        = var.readonly_engine_version
  instance_storage      = var.readonly_instance_storage
  instance_type         = var.readonly_instance_type
}
resource "alicloud_db_connection" "db_connection" {
  instance_id       = alicloud_db_instance.db_instance.0.id
  connection_prefix = var.connection_prefix
  count             = var.new_connection ? length(var.connection_list) : 0
}

