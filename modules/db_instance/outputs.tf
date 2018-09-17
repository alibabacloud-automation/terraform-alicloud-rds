locals {
  this_db_instance_id                          = "${alicloud_db_instance.this_mysql.*.id}"
  this_db_instance_engine                      = "${alicloud_db_instance.this_mysql.*.engine}"
  this_db_instance_engine_version              = "${alicloud_db_instance.this_mysql.*.engine_version}"
  this_db_instance_instance_name               = "${alicloud_db_instance.this_mysql.*.instance_name}"
  this_db_instance_instance_type               = "${alicloud_db_instance.this_mysql.*.instance_type}"
  this_db_instance_zone_id                     = "${alicloud_db_instance.this_mysql.*.zone_id}"
  this_db_instance_connection_string           = "${alicloud_db_instance.this_mysql.*.connection_string}"
  this_db_instance_port                        = "${alicloud_db_instance.this_mysql.*.port}"
  this_db_instance_security_ips                = "${alicloud_db_instance.this_mysql.*.security_ips}"

  this_db_instance_databese_id                 = "${alicloud_db_database.this_db_database.*.id}"
  this_db_instance_databese_name               = "${alicloud_db_database.this_db_database.*.name}"
  
  this_db_instance_databese_account            = "${alicloud_db_account_privilege.this_db_database_privilege.*.account_name}"
  this_db_instance_databese_accountprivilege   = "${alicloud_db_account_privilege.this_db_database_privilege.*.privilege}"
  }

output "this_db_instance_id" {
  value       = "${alicloud_db_instance.this_mysql.*.id}"
}

output "this_db_instance_engine" {
  value       = "${local.this_db_instance_engine}"
}

output "this_db_instance_engine_version" {
  value       = "${local.this_db_instance_engine_version}"
}

output "this_db_instance_instance_name" {
  value       = "${local.this_db_instance_instance_name}"
}

output "this_db_instance_zone_id" {
  value       = "${local.this_db_instance_zone_id}"
}

output "this_db_instance_connection_string" {
  value       = "${local.this_db_instance_connection_string}"
}

output "this_db_instance_port" {
  value       = "${local.this_db_instance_port}"
}

output "this_db_instance_security_ips" {
  value       = "${local.this_db_instance_security_ips}"
}

output "this_db_instance_databese_id" {
  value       = "${local.this_db_instance_databese_id}"
}

output "this_db_instance_databese_name" {
  value       = "${local.this_db_instance_databese_name}"
}

output "this_db_instance_databese_account" {
  value       = "${local.this_db_instance_databese_account}"
}

output "this_db_instance_databese_accountprivilege" {
  value       = "${local.this_db_instance_databese_accountprivilege}"
}

