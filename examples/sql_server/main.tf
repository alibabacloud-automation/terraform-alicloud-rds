module "vpc" {
  source = "alibaba/vpc/alicloud"

  vpc_name     = "my_module_vpc"
  vswitch_name = "my_module_vswitch"
  vswitch_cidrs = [
    "172.16.1.0/24",
    "172.16.2.0/24"
  ]
}

module "sql_server" {
  source               = "../../modules/sql_server"
  character_set        = "utf8"
  connection_prefix    = "testabc"
  region               = "cn-beijing"
  engine               = data.alicloud_db_instance_engines.default.engine
  engine_version       = data.alicloud_db_instance_engines.default.engine_version
  instance_type        = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage     = lookup(data.alicloud_db_instance_classes.default.instance_classes.0.storage_range, "min")
  zone_id              = module.vpc.availability_zones[0]
  vswitch_id            = module.vpc.vswitch_ids[0]
  instance_charge_type = "Postpaid"
  name                 = "dbuser"
  password             = "123456"
  instance_name        = "myTestDBInstance"
  db_name              = "db_test_name"
  account_name         = "account_name"
  type                 = "Normal"
  security_ips         = ["11.193.54.0/24", "101.37.74.0/24", "10.137.42.0/24", "121.43.18.0/24"]
  backup_period        = ["Monday", "Wednesday"]
  backup_time          = "02:00Z-03:00Z"
  retention_period     = 7
  log_backup           = true
  log_retention_period = 7
  privilege            = "ReadWrite"
  database_list = [
    {
      db_name          = "dbtest"
      db_character_set = "utf8"
      db_description   = "test_database"
    },
    {
      db_name          = "dbtest2"
      db_character_set = "utf8"
      db_description   = "test_database2"
    }
  ]
}
data "alicloud_db_instance_engines" "default" {
  instance_charge_type = "PostPaid"
  engine               = "SQLServer"
  engine_version       = "2012"
  output_file          = "engine.json"

}

data "alicloud_db_instance_classes" "default" {
  instance_charge_type = "PostPaid"
  engine               = "SQLServer"
  engine_version       = "2012"
  output_file          = "class.json"
}
