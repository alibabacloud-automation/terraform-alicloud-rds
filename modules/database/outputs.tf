#db_database
output "this_database_description" {
  value       = concat(alicloud_db_database.this[*].description, [""])[0]
  description = "The description of the database."
}

output "this_database_id" {
  value       = concat(alicloud_db_database.this[*].id, [""])[0]
  description = "The id of the database."
}

output "this_database_name" {
  value       = concat(alicloud_db_database.this[*].name, [""])[0]
  description = "The name of the database."
}

output "this_database_account" {
  value       = concat(alicloud_db_account.this[*].name, [""])[0]
  description = "The name of the database account."
}

output "this_database_account_type" {
  value       = concat(alicloud_db_account.this[*].type, [""])[0]
  description = "The type of the database account."
}

output "this_database_account_privilege" {
  value       = concat(alicloud_db_account_privilege.this[*].privilege, [""])[0]
  description = "The privilege of the database account."
}
