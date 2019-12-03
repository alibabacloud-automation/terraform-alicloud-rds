locals {
  this_db_instance_database_id   = alicloud_db_database.this_db_database.*.id
  this_db_instance_database_name = alicloud_db_database.this_db_database.*.name
}

output "this_db_instance_database_id" {
  value = local.this_db_instance_database_id
}

output "this_db_instance_database_name" {
  value = local.this_db_instance_database_name
}

