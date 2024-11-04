provider "alicloud" {
  region = var.region
}
data "alicloud_vpcs" "default" {
  is_default = true
}

module "security_group" {
  source  = "alibaba/security-group/alicloud"
  version = "~> 2.0"

  vpc_id = data.alicloud_vpcs.default.ids[0]

}

data "alicloud_db_zones" "example" {
  engine                   = "PostgreSQL"
  engine_version           = "14.0"
  instance_charge_type     = "Serverless"
  category                 = "serverless_basic"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_db_instance_classes" "example" {
  zone_id                  = data.alicloud_db_zones.example.ids[1]
  engine                   = "PostgreSQL"
  engine_version           = "14.0"
  category                 = "serverless_basic"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "Serverless"
  commodity_code           = "rds_serverless_public_cn"
}

module "postgre_sql" {
  source            = "../.."
  connection_prefix = "developmentabc"

  #################
  # Rds Instance
  #################
  vswitch_id            = data.alicloud_vpcs.default.vpcs[0].vswitch_ids[0]
  engine                = "PostgreSQL"
  engine_version        = "14.0"
  instance_storage      = data.alicloud_db_instance_classes.example.instance_classes[0].storage_range.min
  instance_type         = data.alicloud_db_instance_classes.example.instance_classes[0].instance_class
  instance_charge_type  = "Serverless"
  instance_storage_type = "cloud_essd"
  instance_name         = "myDBInstance"
  category              = "serverless_basic"
  serverless_config = [{
    max_capacity = 8
    min_capacity = 2
  }]
  security_group_ids = [module.security_group.this_security_group_id]
  security_ips = [
    "11.193.54.0/24",
    "101.37.74.0/24",
    "10.137.42.0/24",
  "121.43.18.0/24"]
  #################
  # Rds Backup policy
  #################
  preferred_backup_period     = ["Monday", "Wednesday"]
  preferred_backup_time       = "00:00Z-01:00Z"
  backup_retention_period     = 7
  log_backup_retention_period = 7
  tags = {
    Env      = "Private"
    Location = "Secret"
  }
  allocate_public_connection = false
  create_database            = false
  create_account             = false
}

