variable "region" {
  default = "cn-beijing"
}
variable "profile" {
  default = "default"
}
provider "alicloud" {
  region  = var.region
  profile = var.profile
}
data "alicloud_vpcs" "default" {
  is_default = true
}
module "security_group" {
  source  = "alibaba/security-group/alicloud"
  region  = var.region
  profile = var.profile
  vpc_id  = data.alicloud_vpcs.default.ids.0
  version = "~> 2.0"
}
module "sql_server" {
  source            = "../../modules/sql_server"
  connection_prefix = "developmentabc"
  region            = var.region
  profile           = var.profile
  #################
  # Rds Instance
  #################
  vswitch_id    = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  instance_type = "mssql.x4.medium.s2"
  instance_name = "myDBInstancesql"
  security_ips = [
    "11.193.54.0/24",
    "101.37.74.0/24",
    "10.137.42.0/24",
  "121.43.18.0/24"]
  security_group_ids = [module.security_group.this_security_group_id]
  #################
  # Rds Backup policy
  #################
  preferred_backup_period     = ["Monday", "Wednesday"]
  preferred_backup_time       = "00:00Z-01:00Z"
  backup_retention_period     = 7
  log_backup_retention_period = 7
  ###########
  #databases#
  ###########
  account_name = "account_name1"
  password     = "1234abc"
  privilege    = "ReadWrite"
  databases = [

    {
      name          = "dbuserv1"
      character_set = "utf8"
      description   = "db1"
    },
    {
      name          = "dbuserv2"
      character_set = "utf8"
      description   = "db2"
    },
  ]
  tags = {
    Env      = "Private"
    Location = "Secret"
  }
}





