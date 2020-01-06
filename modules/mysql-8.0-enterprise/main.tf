provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
}
locals {
  engine         = "MySQL"
  engine_version = "8.0"
}
data "alicloud_db_instance_classes" "default" {
  engine         = local.engine
  engine_version = local.engine_version
  category       = "Enterprise"
  storage_type   = var.instance_storage_type
}
module "mysql" {
  source                      = "../../"
  region                      = var.region
  connection_prefix           = var.connection_prefix
  engine                      = local.engine
  engine_version              = local.engine_version
  instance_type               = var.instance_type != "" ? var.instance_type : data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage            = var.instance_storage != "" ? var.instance_storage : lookup(data.alicloud_db_instance_classes.default.instance_classes.0.storage_range, "min")
  instance_charge_type        = var.instance_charge_type
  instance_name               = var.instance_name
  vswitch_id                  = var.vswitch_id
  security_ips                = var.security_ips
  preferred_backup_period     = var.preferred_backup_period
  preferred_backup_time       = var.preferred_backup_time
  backup_retention_period     = var.backup_retention_period
  log_backup_retention_period = var.log_backup_retention_period
  privilege                   = var.privilege
  account_name                = var.account_name
  password                    = var.password
  databases                   = var.databases
}