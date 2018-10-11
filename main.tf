
module "db_instance" {
  source = "./modules/db_instance"
  
  ###############################################################
  #variables for db instance
  ##############################################################

  engine                       = "${var.engine}"
  engine_version               = "${var.engine_version}"
  instance_type                = "${var.instance_type}"
  instance_storage             = "${var.instance_storage}"
  instance_name                = "${var.instance_name}"
  instance_charge_type         = "${var.instance_charge_type}"
  zone_id                      = "${var.zone_id}"
  security_ips                 = "${var.security_ips}"

  ###############################################################
  #variables for backup
  ##############################################################
  backup_period                = "${var.backup_period}"
  backup_time                  = "${var.backup_time}"
  retention_period             = "${var.retention_period}"
  log_backup                   = "${var.log_backup}"
  log_retention_period         = "${var.log_retention_period}"

}

module "db_database" {
  source = "./modules/db_database"

  ###############################################################
  #variables for database
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  db_name                      = "${var.db_name}"
  character_set                = "${var.character_set}"
}

module "db_database_account" {
  source = "./modules/db_database_account"

  ###############################################################
  #variables for db account
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  name                         = "${var.name}"
  password                     = "${var.password}"
  type                         = "${var.type}"

  ##############################################################
  #variables for account_privilege
  ##############################################################
  instance_id                  = "${module.db_instance.this_db_instance_id}"
  privilege                    = "${var.privilege}"
  db_names                     = "${module.db_database.this_db_instance_databese_name}"
}

