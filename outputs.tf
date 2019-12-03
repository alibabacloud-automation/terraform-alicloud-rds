output "db_instance_id" {
  value = module.db_instance.this_db_instance_id
}

output "this_db_instance_engine" {
  value = module.db_instance.this_db_instance_engine
}

output "this_db_instance_engine_version" {
  value = module.db_instance.this_db_instance_engine_version
}

output "this_db_instance_instance_name" {
  value = module.db_instance.this_db_instance_instance_name
}

output "this_db_instance_zone_id" {
  value = module.db_instance.this_db_instance_zone_id
}

output "this_db_instance_connection_string" {
  value = module.db_instance.this_db_instance_connection_string
}

output "this_db_instance_port" {
  value = module.db_instance.this_db_instance_port
}

output "this_db_instance_security_ips" {
  value = module.db_instance.this_db_instance_security_ips
}

output "this_db_database_id" {
  value = module.db_database.this_db_instance_database_id
}

output "this_db_database_name" {
  value = module.db_database.this_db_instance_database_name
}

output "this_db_database_account" {
  value = module.db_database_account.this_db_instance_database_account
}

output "this_db_database_accountprivilege" {
  value = module.db_database_account.this_db_instance_database_accountprivilege
}

