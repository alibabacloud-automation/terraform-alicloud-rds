resource "alicloud_db_account" "this_db_account" {
  instance_id = var.instance_id
  name        = var.name
  password    = var.password
  type        = var.type
}

resource "alicloud_db_account_privilege" "this_db_database_privilege" {
  instance_id  = var.instance_id
  account_name = alicloud_db_account.this_db_account.name
  privilege    = var.privilege
  db_names     = var.db_names
}

