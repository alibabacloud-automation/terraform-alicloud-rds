
module "db_instance" {
  source = "./modules/db_instance"
  
  ###############################################################
  #variables for db instance
  ##############################################################

  engine                       = "MySQL"
  engine_version               = "5.7"
  instance_type                = "mysql.n1.micro.1"
  instance_storage             = "20"
  instance_name                = "myTestDBInstance"
  instance_charge_type         = "Postpaid"
  zone_id                      = "cn-hangzhou-b"
  security_ips                 = ["11.193.54.0/24","101.37.74.0/24","10.137.42.0/24","121.43.18.0/24"]

  ###############################################################
  #variables for db connection
  ##############################################################
  connection_prefix            = "mydbname"
  port                         = "3306"

  ###############################################################
  #variables for backup
  ##############################################################
  backup_period                = ["Monday", "Wednesday"]
  backup_time                  = "02:00Z-03:00Z"
  retention_period             = 7
  log_backup                   = true
  log_retention_period         = 7

}

module "db_database" {
  source = "./modules/db_database"

  ###############################################################
  #variables for database
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  db_name                      = "tf_database"
  character_set                = "utf8"
}

module "db_database_account" {
  source = "./modules/db_database_account"

  ###############################################################
  #variables for db account
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  name                         = "dbuser"
  password                     = "testUser123"
  type                         = "Normal"

  ##############################################################
  #variables for account_privilege
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  privilege                    = "ReadWrite"
  db_names                     = "${module.db_database.this_db_instance_databese_name}"
}


output "db_instance_id" {
  value       = "${module.db_instance.this_db_instance_id}"
}

output "this_db_instance_engine" {
  value       = "${module.db_instance.this_db_instance_engine}"
}

output "this_db_instance_engine_version" {
  value       = "${module.db_instance.this_db_instance_engine_version}"
}

output "this_db_instance_instance_name" {
  value       = "${module.db_instance.this_db_instance_instance_name}"
}

output "this_db_instance_zone_id" {
  value       = "${module.db_instance.this_db_instance_zone_id}"
}

output "this_db_instance_connection_string" {
  value       = "${module.db_instance.this_db_instance_connection_string}"
}

output "this_db_instance_port" {
  value       = "${module.db_instance.this_db_instance_port}"
}

output "this_db_instance_security_ips" {
  value       = "${module.db_instance.this_db_instance_security_ips}"
}

output "this_db_databese_id" {
  value       = "${module.db_database.this_db_instance_databese_id}"
}

output "this_db_databese_name" {
  value       = "${module.db_database.this_db_instance_databese_name}"
}

output "this_db_databese_account" {
  value       = "${module.db_database_account.this_db_instance_databese_account}"
}

output "this_db_databese_accountprivilege" {
  value       = "${module.db_database_account.this_db_instance_databese_accountprivilege}"
}


