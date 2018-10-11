locals {
  this_db_instance_databese_id                 = "${alicloud_db_database.this_db_database.*.id}"
  this_db_instance_databese_name               = "${alicloud_db_database.this_db_database.*.name}" 
}

output "this_db_instance_databese_id" {
  value       = "${local.this_db_instance_databese_id}"
}

output "this_db_instance_databese_name" {
  value       = "${local.this_db_instance_databese_name}"
}
