data "alicloud_db_zones" "default" {
}

data "alicloud_db_instance_classes" "default" {
  engine         = "MySQL"
  engine_version = "5.6"
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_db_zones.default.zones.0.id]
}

module "security_group" {
  source = "alibaba/security-group/alicloud"
  vpc_id = module.vpc.this_vpc_id
}

module "rds" {
  source = "../.."

  #alicloud_db_instance
  create_instance = true

  engine         = "MySQL"
  engine_version = "5.6"

  instance_name              = var.instance_name
  instance_type              = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage_type      = "local_ssd"
  instance_storage           = var.instance_storage
  instance_charge_type       = var.instance_charge_type
  period                     = var.period
  security_ips               = var.security_ips
  vswitch_id                 = module.vpc.this_vswitch_ids[0]
  security_group_ids         = [module.security_group.this_security_group_id]
  sql_collector_status       = var.sql_collector_status
  sql_collector_config_value = var.sql_collector_config_value
  tags                       = var.tags

  #alicloud_db_backup_policy
  backup_retention_period     = var.backup_retention_period
  log_backup_retention_period = var.log_backup_retention_period
  preferred_backup_time       = var.preferred_backup_time
  preferred_backup_period     = var.preferred_backup_period
  enable_backup_log           = var.enable_backup_log

  #alicloud_db_connection
  allocate_public_connection = true

  connection_prefix = "tf-testacc"
  port              = 3306

  #databases
  create_database = true
  create_account  = true

  databases = [
    {
      name          = "tf_testacc_db"
      character_set = "utf8"
      description   = var.description
    }
  ]
  account_name = "account_name"
  password     = var.password
  type         = "Normal"
  privilege    = "ReadOnly"

}