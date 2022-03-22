resource "alicloud_db_database" "this" {
  count         = var.create_database ? length(var.databases) : 0
  instance_id   = var.db_instance_id
  name          = lookup(var.databases[count.index], "name")
  character_set = lookup(var.databases[count.index], "character_set")
  description   = lookup(var.databases[count.index], "description")
}

resource "alicloud_db_account" "this" {
  count            = var.create_account ? 1 : 0
  db_instance_id   = var.db_instance_id
  account_name     = var.account_name
  account_password = var.password
  account_type     = var.type
}

resource "alicloud_db_account_privilege" "this" {
  count        = var.create_account && var.create_database ? 1 : 0
  instance_id  = var.db_instance_id
  account_name = concat(alicloud_db_account.this.*.name, [""])[0]
  db_names     = alicloud_db_database.this.*.name
  privilege    = var.privilege
}