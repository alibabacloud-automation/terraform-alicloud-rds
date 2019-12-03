locals {
  this_db_instance_database_account          = alicloud_db_account_privilege.this_db_database_privilege.*.account_name
  this_db_instance_database_accountprivilege = alicloud_db_account_privilege.this_db_database_privilege.*.privilege
}

output "this_db_instance_database_account" {
  value = local.this_db_instance_database_account
}

output "this_db_instance_database_accountprivilege" {
  value = local.this_db_instance_database_accountprivilege
}

