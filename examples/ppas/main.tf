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
module "ppas" {
  source  = "../../modules/ppas-9.3-high-availability"
  region  = var.region
  profile = var.profile
  #################
  # Rds Instance
  #################
  vswitch_id         = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  connection_prefix  = "developmentabc"
  instance_name      = "myDBInstance"
  security_group_ids = [module.security_group.this_security_group_id]
  security_ips       = ["11.193.54.0/24", "101.37.74.0/24", "10.137.42.0/24", "121.43.18.0/24"]
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
}

