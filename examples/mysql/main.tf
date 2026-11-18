provider "alicloud" {
  region = var.region
}
data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_charge_type     = "PostPaid"
  category                 = "HighAvailability"
  db_instance_storage_type = "cloud_essd"
}
resource "alicloud_vpc" "this" {
  vpc_name   = "terraform-rds-mysql-example"
  cidr_block = "172.16.0.0/16"
}
resource "alicloud_vswitch" "this" {
  vswitch_name = "terraform-rds-mysql-example"
  vpc_id       = alicloud_vpc.this.id
  zone_id      = data.alicloud_db_zones.default.zones[0].id
  cidr_block   = "172.16.0.0/24"
}
module "security_group" {
  source = "alibaba/security-group/alicloud"

  vpc_id  = alicloud_vpc.this.id
  version = "3.0.0"
}
module "mysql" {
  source = "../../modules/mysql-8.0-high-availability"

  #################
  # Rds Instance
  #################
  connection_prefix     = "developmentabc"
  vswitch_id            = alicloud_vswitch.this.id
  instance_name         = "myDBInstance"
  instance_type         = "mysql.x2.large.2c"
  instance_storage      = 20
  instance_storage_type = "cloud_essd"
  security_group_ids    = [module.security_group.this_security_group_id]
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
  password     = "Example1234"
  tags = {
    Env      = "Private"
    Location = "Secret"
  }

}





