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

resource "alicloud_db_database" "this_db_database" {

  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  name                         = "${var.db_name}"
  character_set                = "${var.character_set}"

}

resource "alicloud_db_account" "this_db_account" {

  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  name                         = "${var.name}"
  password                     = "${var.password}"
  type                         = "${var.type }"

}

resource "alicloud_db_account_privilege" "this_db_database_privilege" {

  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  account_name                 = "${alicloud_db_account.this_db_account.name}"
  privilege                    = "${var.privilege}"
  db_names                     = ["${alicloud_db_database.this_db_database.*.name}"]

}

resource "alicloud_db_backup_policy" "this_db_account_backup_policy" {
  
  instance_id                  = "${alicloud_db_instance.this_mysql.id}"
  backup_period                = "${var.backup_period}"
  backup_time                  = "${var.backup_time}"
  retention_period             = "${var.retention_period}"
  log_backup                   = "${var.log_backup}"
  log_retention_period         = "${var.log_retention_period}"

}