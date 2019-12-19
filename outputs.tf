
output "this_db_description" {
  value = alicloud_db_database.db_database.*.description
}
output "this_db_instance_database_id" {
  value = alicloud_db_database.db_database.*.id
}

output "this_db_instance_database_name" {
  value = alicloud_db_database.db_database.*.name
}

output "this_db_instance_database_account" {
  value = alicloud_db_account_privilege.db_account_privilege.*.account_name
}

output "this_db_instance_database_accountprivilege" {
  value = alicloud_db_account_privilege.db_account_privilege.*.privilege
}

#db_instance
locals {
  this_db_instance_id                = alicloud_db_instance.db_instance.*.id
  this_db_instance_engine            = alicloud_db_instance.db_instance.*.engine
  this_db_instance_engine_version    = alicloud_db_instance.db_instance.*.engine_version
  this_db_instance_instance_name     = alicloud_db_instance.db_instance.*.instance_name
  this_db_instance_instance_type     = alicloud_db_instance.db_instance.*.instance_type
  this_db_instance_zone_id           = alicloud_db_instance.db_instance.*.zone_id
  this_db_instance_connection_string = alicloud_db_instance.db_instance.*.connection_string
  this_db_instance_port              = alicloud_db_instance.db_instance.*.port
  this_db_instance_security_ips      = alicloud_db_instance.db_instance.*.security_ips
}

output "this_db_instance_id" {
  value = alicloud_db_instance.db_instance.*.id
}

output "this_db_instance_engine" {
  value = alicloud_db_instance.db_instance.*.engine
}

output "this_db_instance_engine_version" {
  value = alicloud_db_instance.db_instance.*.engine_version
}

output "this_db_instance_instance_name" {
  value = alicloud_db_instance.db_instance.*.instance_name
}

output "this_db_instance_zone_id" {
  value = alicloud_db_instance.db_instance.*.zone_id
}

output "this_db_instance_connection_string" {
  value = alicloud_db_instance.db_instance.*.connection_string
}

output "this_db_instance_port" {
  value = alicloud_db_instance.db_instance.*.port
}

output "this_db_instance_security_ips" {
  value = alicloud_db_instance.db_instance.*.security_ips
}

output "this_db_instance_instance_type" {
  value = alicloud_db_instance.db_instance.*.instance_type
}
