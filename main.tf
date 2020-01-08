provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/rds"
}
resource "alicloud_db_instance" "this" {
  count                = var.existing_instance_id != "" ? 0 : var.create_instance ? 1 : 0
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  instance_name        = var.instance_name
  period               = var.period
  security_ips         = var.security_ips
  vswitch_id           = var.vswitch_id
  tags                 = var.tags
  security_group_id    = length(local.security_group_ids[0]) > 0 ? join(",", local.security_group_ids) : ""
}
resource "alicloud_db_backup_policy" "this" {
  count                = local.create_more_resources ? 1 : 0
  instance_id          = local.this_instance_id
  retention_period     = local.retention_period
  backup_time          = local.backup_time
  backup_period        = local.backup_period
  log_retention_period = local.log_retention_period
  enable_backup_log    = var.enable_backup_log
}


resource "alicloud_db_connection" "db_connection" {
  count             = local.create_more_resources && var.allocate_public_connection && var.connection_prefix != "" ? 1 : 0
  instance_id       = local.this_instance_id
  connection_prefix = var.connection_prefix
  port              = var.port
}

module "databases" {
  source                  = "./modules/database"
  profile                 = var.profile
  shared_credentials_file = var.shared_credentials_file
  region                  = var.region
  skip_region_validation  = var.skip_region_validation
  create_database         = local.create_database
  create_account          = local.create_account
  db_instance_id          = local.this_instance_id
  password                = var.password
  type                    = var.type
  account_name            = var.account_name
  privilege               = var.privilege
  databases               = var.databases
}
