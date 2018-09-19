resource "alicloud_db_instance" "this_mysql" {
  
  engine                       = "${var.engine}"
  engine_version               = "${var.engine_version}"
  instance_type                = "${var.instance_type}"
  instance_storage             = "${var.instance_storage}"
  instance_name                = "${var.instance_name}"
  instance_charge_type         = "${var.instance_charge_type}"
  zone_id                      = "${var.zone_id}"
  period                       = "${var.period}"
  security_ips                 = "${var.security_ips}"

}

resource "alicloud_db_connection" "this_db_connection" {
  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  connection_prefix            = "${var.connection_prefix}"
  port                         = "${var.port}"
}

resource "alicloud_db_backup_policy" "this_db_backup_policy" {
  
  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  backup_period                = "${var.backup_period}"
  backup_time                  = "${var.backup_time}"
  retention_period             = "${var.retention_period}"
  log_backup                   = "${var.log_backup}"
  log_retention_period         = "${var.log_retention_period}"

}
