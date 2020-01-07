#################
# Rds Instance
#################
output "this_db_instance_id" {
  description = "Rds instance id."
  value       = local.this_instance_id
}
output "this_db_instance_engine" {
  description = "Rds instance engine."
  value       = alicloud_db_instance.this.*.engine
}
output "this_db_instance_engine_version" {
  description = "Rds instance engine version."
  value       = alicloud_db_instance.this.*.engine_version
}
output "this_db_instance_type" {
  description = "Rds instance type."
  value       = alicloud_db_instance.this.*.instance_type
}
output "this_db_instance_storage" {
  description = "Rds instance storage."
  value       = alicloud_db_instance.this.*.instance_storage
}
output "this_db_instance_charge_type" {
  description = "Rds instance charge type."
  value       = alicloud_db_instance.this.*.instance_charge_type
}
output "this_db_instance_name" {
  description = "Rds instance name."
  value       = alicloud_db_instance.this.*.instance_name
}
output "this_db_instance_period" {
  description = "Rds instance charge period when Prepaid."
  value       = alicloud_db_instance.this.*.period
}
output "this_db_instance_security_ips" {
  description = "Rds instance security ip list."
  value       = alicloud_db_instance.this.*.security_ips
}
output "this_db_instance_zone_id" {
  description = "The zone id in which the Rds instance."
  value       = alicloud_db_instance.this.*.zone_id
}
output "this_db_instance_vswitch_id" {
  description = "The vswitch id in which the Rds instance."
  value       = alicloud_db_instance.this.*.security_ips
}
output "this_db_instance_security_group_ids" {
  description = "The security group ids in which the Rds instance."
  value       = spilt(",", alicloud_db_instance.this.*.security_group_id)
}

#################
# Rds instance connection
#################
output "this_db_instance_connection_string" {
  description = "Rds instance public connection string"
  value       = alicloud_db_instance.this.*.connection_string
}
output "this_db_instance_port" {
  description = "Rds instance public connection string"
  value       = alicloud_db_instance.this.*.port
}
output "this_db_instance_connection_ip_address" {
  description = "Rds instance public connection string's ip address"
  value       = alicloud_db_connection.db_connection.*.ip_address
}

#################
# Rds database
#################
output "this_db_database_description" {
  description = "Rds database description."
  value       = module.databases.this_database_description
}
output "this_db_database_id" {
  description = "Rds database id."
  value       = module.databases.this_database_id
}
output "this_db_database_name" {
  description = "Rds database id."
  value       = module.databases.this_database_name
}

#################
# Rds database account
#################
output "this_db_database_account" {
  description = "Rds database account."
  value       = module.databases.this_database_account
}
output "this_db_database_account_privilege" {
  description = "Rds database account privilege."
  value       = module.databases.this_database_account_privilege
}

output "this_db_database_account_type" {
  description = "Rds database account type."
  value       = module.databases.this_database_account_type
}

#################
# Deprecated outputs
#################
output "db_instance_id" {
  description = "`(Deprecated)` It has been deprecated and use `this_db_instance_id` instead."
  value       = local.this_instance_id
}
output "this_db_database_accountprivilege" {
  description = "`(Deprecated)` It has been deprecated and use `this_db_database_account_privilege` instead."
  value       = local.this_instance_id
}
output "this_db_instance_instance_name" {
  description = "`(Deprecated)` It has been deprecated and use `this_db_instance_name` instead."
  value       = local.this_instance_id
}