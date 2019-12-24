locals {
  vswitch_name_regex        = var.vswitch_name_regex
  vswitch_tags              = var.vswitch_tags
  concat_vsw_ids            = distinct(compact(concat([var.vswitch_id], var.vswitch_ids)))
  vswitch_resource_group_id = var.vswitch_resource_group_id
  vswitch_ids               = length(local.concat_vsw_ids) > 0 ? local.concat_vsw_ids : local.vswitch_name_regex != "" || length(local.vswitch_tags) > 0 || local.vswitch_resource_group_id != "" ? data.alicloud_vswitches.this.ids : []

  # Get ID of RDS Instance
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_db_instance.this.*.id, [""])[0]

  # Whether to create database, account and other resources
  create_more_resources = var.existing_instance_id != "" || var.create_instance ? true : false
  create_account        = local.create_more_resources && var.create_account
  create_database       = local.create_more_resources && var.create_database
}
data "alicloud_vswitches" "this" {
  name_regex        = local.vswitch_name_regex
  tags              = local.vswitch_tags
  resource_group_id = local.vswitch_resource_group_id
}
