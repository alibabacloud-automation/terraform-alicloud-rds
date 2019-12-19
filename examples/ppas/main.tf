
module "ppas" {
  source               = "../../modules/ppas"
  region               = "cn-hangzhou"
  character_set        = "utf8"
  connection_prefix    = ""
  engine               = data.alicloud_db_instance_engines.default.engine
  engine_version       = data.alicloud_db_instance_engines.default.engine_version
  instance_type        = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage     = lookup(data.alicloud_db_instance_classes.default.instance_classes.0.storage_range, "min", null)
  zone_id              = lookup(data.alicloud_db_instance_classes.default.instance_classes.0.zone_ids[0], "id")
  instance_charge_type = "Postpaid"
  name                 = "dbuser"
  password             = "123456"
  instance_name        = "myTestDBInstance"
  account_name         = "account_name"
  type                 = "Normal"
  security_ips         = ["11.193.54.0/24", "101.37.74.0/24", "10.137.42.0/24", "121.43.18.0/24"]
  backup_period        = ["Monday", "Wednesday"]
  backup_time          = "02:00Z-03:00Z"
  retention_period     = 7
  log_backup           = true
  log_retention_period = 7


}

data "alicloud_db_instance_engines" "default" {
  instance_charge_type = "PostPaid"
  engine               = "PPAS"
  engine_version       = "9.3"
  output_file          = "engine.json"

}

data "alicloud_db_instance_classes" "default" {
  instance_charge_type = "PostPaid"
  engine               = "PPAS"
  engine_version       = "9.3"
  output_file          = "class.json"
}