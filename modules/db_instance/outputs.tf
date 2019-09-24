locals {
  this_db_instance_id                = alicloud_db_instance.this_instance.id
  this_db_instance_engine            = alicloud_db_instance.this_instance.engine
  this_db_instance_engine_version    = alicloud_db_instance.this_instance.engine_version
  this_db_instance_instance_name     = alicloud_db_instance.this_instance.instance_name
  this_db_instance_instance_type     = alicloud_db_instance.this_instance.instance_type
  this_db_instance_zone_id           = alicloud_db_instance.this_instance.zone_id
  this_db_instance_connection_string = alicloud_db_instance.this_instance.connection_string
  this_db_instance_port              = alicloud_db_instance.this_instance.port
  this_db_instance_security_ips      = alicloud_db_instance.this_instance.security_ips
}

output "this_db_instance_id" {
  value = local.this_db_instance_id
}

output "this_db_instance_engine" {
  value = local.this_db_instance_engine
}

output "this_db_instance_engine_version" {
  value = local.this_db_instance_engine_version
}

output "this_db_instance_instance_name" {
  value = local.this_db_instance_instance_name
}

output "this_db_instance_zone_id" {
  value = local.this_db_instance_zone_id
}

output "this_db_instance_connection_string" {
  value = local.this_db_instance_connection_string
}

output "this_db_instance_port" {
  value = local.this_db_instance_port
}

output "this_db_instance_security_ips" {
  value = local.this_db_instance_security_ips
}

