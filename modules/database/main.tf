provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/rds"
}

resource "alicloud_db_database" "this" {
  count         = var.create_database ? length(var.databases) : 0
  instance_id   = var.db_instance_id
  name          = lookup(var.databases[count.index], "name")
  character_set = lookup(var.databases[count.index], "character_set")
  description   = lookup(var.databases[count.index], "description")
}
resource "alicloud_db_account" "this" {
  count       = var.create_account && var.account_name != "" ? 1 : 0
  instance_id = var.db_instance_id
  name        = var.account_name
  password    = var.password
  type        = var.type
}

resource "alicloud_db_account_privilege" "this" {
  count        = var.create_account && var.create_database && length(var.databases) > 0 ? 1 : 0
  instance_id  = var.db_instance_id
  account_name = concat(alicloud_db_account.this.*.name, [""])[0]
  db_names     = alicloud_db_database.this.*.name
  privilege    = var.privilege
}
