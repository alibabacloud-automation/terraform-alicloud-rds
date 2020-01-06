variable "region" {
  default = "cn-beijing"
}
provider "alicloud" {
  region = var.region
}
data "alicloud_vpcs" "default" {
  is_default = true
}
module "ppas" {
  source                      = "../../modules/ppas-9.3-high-availability"
  region                      = var.region
  vswitch_id                  = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  connection_prefix           = "developmentabc"
  instance_name               = "myDBInstance"
  security_ips                = ["11.193.54.0/24", "101.37.74.0/24", "10.137.42.0/24", "121.43.18.0/24"]
  preferred_backup_period     = ["Monday", "Wednesday"]
  preferred_backup_time       = "00:00Z-01:00Z"
  backup_retention_period     = 7
  log_backup_retention_period = 7
}

