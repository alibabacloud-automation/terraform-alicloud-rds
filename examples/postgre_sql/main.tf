variable "region" {
  default = "cn-beijing"
}
provider "alicloud" {
  region = var.region
}
data "alicloud_vpcs" "default" {
  is_default = true
}
module "postgre_sql" {
  source            = "../../modules/postgre_sql-9.4-high-availability"
  connection_prefix = "developmentabc"
  region            = var.region
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
}

