
output "this_database_description" {
  value = module.databases.this_database_description
}
output "this_database_id" {
  value = module.databases.this_database_account
}

output "this_database_name" {
  value = module.databases.this_database_name
}

output "this_database_account" {
  value = module.databases.this_database_account
}

output "this_database_account_privilege" {
  value = module.databases.this_database_account_privilege
}
output "this_db_instance_id" {
  value = alicloud_db_instance.this.*.id
}

output "this_db_instance_engine" {
  value = alicloud_db_instance.this.*.engine
}

output "this_db_instance_engine_version" {
  value = alicloud_db_instance.this.*.engine_version
}

output "this_db_instance_instance_name" {
  value = alicloud_db_instance.this.*.instance_name
}

output "this_db_instance_connection_string" {
  value = alicloud_db_instance.this.*.connection_string
}

output "this_db_instance_port" {
  value = alicloud_db_instance.this.*.port
}

output "this_db_instance_security_ips" {
  value = alicloud_db_instance.this.*.security_ips
}

output "this_db_instance_instance_type" {
  value = alicloud_db_instance.this.*.instance_type
}
output "this_db_instance_zone_id" {
  value = alicloud_db_instance.this.*.zone_id
}
