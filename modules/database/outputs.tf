#db_database
output "this_database_description" {

  value = alicloud_db_database.this.*.description
}

output "this_database_id" {
  value = alicloud_db_database.this.*.id
}

output "this_database_name" {
  value = alicloud_db_database.this.*.name
}

output "this_database_account" {
  value = alicloud_db_account.this.*.name
}

output "this_database_account_type" {
  value = alicloud_db_account.this.*.type
}
output "this_database_account_privilege" {
  value = alicloud_db_account_privilege.this.*.privilege
}

