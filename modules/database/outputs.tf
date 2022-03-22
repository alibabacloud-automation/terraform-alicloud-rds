#db_database
output "this_database_description" {
  value = concat(alicloud_db_database.this.*.description, [""])[0]
}

output "this_database_id" {
  value = concat(alicloud_db_database.this.*.id, [""])[0]
}

output "this_database_name" {
  value = concat(alicloud_db_database.this.*.name, [""])[0]
}

output "this_database_account" {
  value = concat(alicloud_db_account.this.*.name, [""])[0]
}

output "this_database_account_type" {
  value = concat(alicloud_db_account.this.*.type, [""])[0]
}

output "this_database_account_privilege" {
  value = concat(alicloud_db_account_privilege.this.*.privilege, [""])[0]
}