locals {
  vswitch_name_regex        = var.vswitch_name_regex
  vswitch_tags              = var.vswitch_tags
  concat_vsw_ids            = distinct(compact(concat([var.vswitch_id], var.vswitch_ids)))
  vswitch_resource_group_id = var.vswitch_resource_group_id
  vswitch_ids               = length(local.concat_vsw_ids) > 0 ? local.concat_vsw_ids : local.vswitch_name_regex != "" || length(local.vswitch_tags) > 0 || local.vswitch_resource_group_id != "" ? data.alicloud_vswitches.this.ids : []
}
data "alicloud_vswitches" "this" {
  name_regex        = local.vswitch_name_regex
  tags              = local.vswitch_tags
  resource_group_id = local.vswitch_resource_group_id
}
