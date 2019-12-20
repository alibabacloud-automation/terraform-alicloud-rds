

module "ppas" {
  source                   = "../../"
  region                   = var.region
  character_set            = var.character_set
  connection_prefix        = var.connection_prefix
  engine                   = var.engine
  engine_version           = var.engine_version
  instance_type            = var.instance_type
  instance_storage         = var.instance_storage
  zone_id                  = var.zone_id
  instance_charge_type     = var.instance_charge_type
  name                     = var.name
  password                 = var.password
  instance_name            = var.instance_name
  db_name                  = var.db_name
  account_name             = var.account_name
  type                     = var.type
  security_ips             = var.security_ips
  privilege                = var.privilege
  vswitch_id               = var.vswitch_id
  new_db_readonly_instance = var.new_db_readonly_instance
  new_account              = var.new_account
  new_backup_policy        = var.new_account
  new_database             = var.new_database
  new_instance             = var.new_instance
  new_privilege            = var.new_privilege
  new_connection           = var.new_connection
}