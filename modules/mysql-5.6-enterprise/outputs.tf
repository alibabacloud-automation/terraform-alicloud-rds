#db_database
output "this_database_description" {
  value = module.mysql.this_database_description
}

output "this_database_id" {
  value = module.mysql.this_database_id
}

output "this_database_name" {
  value = module.mysql.this_database_name
}

output "this_database_account" {
  value = module.mysql.this_database_account
}

output "this_database_account_privilege" {
  value = module.mysql.this_database_account_privilege
}

#db_instance

output "this_db_instance_id" {
  value = module.mysql.this_db_instance_id
}

output "this_db_instance_engine" {
  value = module.mysql.this_db_instance_engine
}

output "this_db_instance_engine_version" {
  value = module.mysql.this_db_instance_engine_version
}

output "this_db_instance_instance_name" {
  value = module.mysql.this_db_instance_instance_name
}



output "this_db_instance_connection_string" {
  value = module.mysql.this_db_instance_connection_string
}

output "this_db_instance_port" {
  value = module.mysql.this_db_instance_port
}

output "this_db_instance_security_ips" {
  value = module.mysql.this_db_instance_security_ips
}

output "this_db_instance_instance_type" {
  value = module.mysql.this_db_instance_instance_type
}