variable "region" {
  default = "cn-hangzhou"
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
module "mysql" {
  source  = "../../modules/mysql-8.0-high-availability"
  region  = var.region
  profile = var.profile
  #################
  # Rds Instance
  #################
  connection_prefix  = "developmentabc"
  vswitch_id         = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  instance_name      = "myDBInstance"
  instance_type      = "rds.mysql.t1.small"
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
  enable_backup_log           = true
  ###########
  #databases#
  ###########
  privilege = "ReadWrite"
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
  #################
  # Rds Database account
  #################
  account_name = "account_name1"
  password     = "1234abc"
  tags = {
    Env      = "Private"
    Location = "Secret"
  }
}





