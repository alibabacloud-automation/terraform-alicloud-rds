#################
# Rds Instance
#################
output "this_db_instance_id" {
  description = "Rds instance id."
  value       = module.mysql.this_db_database_id
}
output "this_db_instance_engine" {
  description = "Rds instance engine."
  value       = module.mysql.this_db_instance_engine
}
output "this_db_instance_engine_version" {
  description = "Rds instance engine version."
  value       = module.mysql.this_db_instance_engine_version
}
output "this_db_instance_type" {
  description = "Rds instance type."
  value       = module.mysql.this_db_instance_type
}
output "this_db_instance_storage" {
  description = "Rds instance storage."
  value       = module.mysql.this_db_instance_storage
}
output "this_db_instance_charge_type" {
  description = "Rds instance charge type."
  value       = module.mysql.this_db_instance_charge_type
}
output "this_db_instance_name" {
  description = "Rds instance name."
  value       = module.mysql.this_db_instance_name
}
output "this_db_instance_security_ips" {
  description = "Rds instance security ip list."
  value       = module.mysql.this_db_instance_security_ips
}
output "this_db_instance_zone_id" {
  description = "The zone id in which the Rds instance."
  value       = module.mysql.this_db_instance_zone_id
}
output "this_db_instance_vswitch_id" {
  description = "The vswitch id in which the Rds instance."
  value       = module.mysql.this_db_instance_vswitch_id
}
output "this_db_instance_security_group_ids" {
  description = "The security group ids in which the Rds instance."
  value       = module.mysql.this_db_instance_security_group_ids
}
output "this_db_instance_tags" {
  description = "Rds instance tags"
  value       = module.mysql.this_db_instance_tags
}

#################
# Rds instance connection
#################
output "this_db_instance_connection_string" {
  description = "Rds instance public connection string"
  value       = module.mysql.this_db_instance_connection_string
}
output "this_db_instance_port" {
  description = "Rds instance public connection string"
  value       = module.mysql.this_db_instance_port
}
output "this_db_instance_connection_ip_address" {
  description = "Rds instance public connection string's ip address"
  value       = module.mysql.this_db_instance_connection_ip_address
}

#################
# Rds database
#################
output "this_db_database_description" {
  description = "Rds database description."
  value       = module.mysql.this_db_database_description
}
output "this_db_database_id" {
  description = "Rds database id."
  value       = module.mysql.this_db_database_id
}
output "this_db_database_name" {
  description = "Rds database id."
  value       = module.mysql.this_db_database_name
}

#################
# Rds database account
#################
output "this_db_database_account" {
  description = "Rds database account."
  value       = module.mysql.this_db_database_account
}
output "this_db_database_account_privilege" {
  description = "Rds database account privilege."
  value       = module.mysql.this_db_database_account_privilege
}

output "this_db_database_account_type" {
  description = "Rds database account type."
  value       = module.mysql.this_db_database_account_type
}
