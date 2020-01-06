variable "region" {
  default = "cn-hangzhou"
}
provider "alicloud" {
  region = var.region
}
data "alicloud_vpcs" "default" {
  is_default = true
}
module "mysql" {
  source            = "../../modules/mysql-8.0-high-availability"
  region            = var.region
  connection_prefix = "developmentabc"
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  instance_name     = "myDBInstance"

  security_ips = [
    "11.193.54.0/24",
    "101.37.74.0/24",
    "10.137.42.0/24",
  "121.43.18.0/24"]
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
}





