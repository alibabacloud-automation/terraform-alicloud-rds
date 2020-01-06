locals {
  # Get ID of RDS Instance
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_db_instance.this.*.id, [""])[0]

  # Whether to create database, account and other resources
  create_more_resources = var.existing_instance_id != "" || var.create_instance ? true : false
  create_account        = local.create_more_resources && var.create_account
  create_database       = local.create_more_resources && var.create_database
}

