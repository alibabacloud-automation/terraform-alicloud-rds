locals {
  # Get ID of RDS Instance
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : var.instance_id != "" ? var.instance_id : concat(alicloud_db_instance.this.*.id, [""])[0]
  # Whether to create database, account and other resources
  create_more_resources = var.existing_instance_id != "" || var.create_instance ? true : false
  create_account        = local.create_more_resources && var.create_account
  create_database       = local.create_more_resources && var.create_database
  #
  backup_time          = length(var.preferred_backup_time) > 0 ? var.preferred_backup_time : var.backup_time
  retention_period     = var.backup_retention_period != 7 ? var.backup_retention_period : var.retention_period
  backup_period        = length(var.preferred_backup_period) > 0 ? var.preferred_backup_period : var.backup_period
  log_retention_period = var.log_backup_retention_period != 7 ? var.log_backup_retention_period : var.log_retention_period
  security_group_ids   = length(var.security_group_ids) > 0 ? var.security_group_ids : var.vpc_security_group_ids
}

