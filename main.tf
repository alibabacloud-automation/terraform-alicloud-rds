resource "alicloud_db_instance" "this" {
  count                      = var.create_instance ? 1 : 0
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_name              = var.instance_name
  instance_type              = var.instance_type
  db_instance_storage_type   = var.instance_storage_type
  instance_storage           = var.instance_storage
  instance_charge_type       = var.instance_charge_type
  period                     = var.period
  security_ips               = var.security_ips
  vswitch_id                 = var.vswitch_id
  security_group_ids         = local.security_group_ids
  sql_collector_status       = var.sql_collector_status
  sql_collector_config_value = var.sql_collector_config_value
  tags                       = var.tags
}

resource "alicloud_db_backup_policy" "this" {
  count                       = local.create_more_resources ? 1 : 0
  instance_id                 = local.this_instance_id
  backup_retention_period     = local.retention_period
  log_backup_retention_period = local.log_retention_period
  preferred_backup_time       = local.backup_time
  preferred_backup_period     = local.backup_period
  enable_backup_log           = var.enable_backup_log
}

resource "alicloud_db_connection" "db_connection" {
  count             = local.create_more_resources && var.allocate_public_connection ? 1 : 0
  instance_id       = local.this_instance_id
  connection_prefix = var.connection_prefix
  port              = var.port
}

module "databases" {
  source = "./modules/database"

  create_database = local.create_database
  create_account  = local.create_account

  databases      = var.databases
  db_instance_id = local.this_instance_id
  account_name   = var.account_name
  password       = var.password
  type           = var.type
  privilege      = var.privilege

}