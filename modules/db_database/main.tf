resource "alicloud_db_database" "this_db_database" {

  instance_id                  = "${var.instance_id}"
  name                         = "${var.db_name}"
  character_set                = "${var.character_set}"

}
