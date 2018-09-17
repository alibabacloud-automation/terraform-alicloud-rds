##############################################################
#variables for db alicloud_db_instance
##############################################################

variable "engine" {
  description = "The database engine to use"
}

variable "engine_version" {
  description = "The engine version to use"
}

variable "instance_storage" {
  description = "The allocated storage in gigabytes"
}

variable "instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. fall list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = false
}

variable "instance_name" {
  description = " The name of DB instance. It a string of 2 to 256 characters"
  default     = ""
}

variable "instance_charge_type" {
  description = "Valid values are Prepaid, Postpaid, Default to Postpaid"
  default     = "Postpaid"
}

variable "period" {
  description = "(Optional) The duration that you will buy DB instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. Default to 1"
  default     = 1
}

variable "zone_id" {
  description = "(Optional) The Zone to launch the DB instance. "
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  default     = []
}

variable "vswitch_id" {
  description = "(Optional) The virtual switch ID to launch DB instances in one VPC."
  default = ""
}

variable "security_ips" {
  description = " (Optional) List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  default     = []
}

##############################################################
#variables for alicloud_db_account
##############################################################


variable "instance_id" {
  description = "The Id of instance in which account belongs."
  default = ""
}

variable "name" {
  description = "Operation account requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 16 characters."
}

variable "password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
}

variable "type" {
  description = "Privilege type of account.Normal: Common privilege. Super: High privilege.Default to Normal. It is is valid for MySQL 5.5/5.6 only."
  default     = "Normal"
}


##############################################################
#variables for alicloud_db_database
##############################################################

variable "db_name" {
  description = "(Required) Name of the database requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 64 characters."
}

variable "character_set" {
  description = "(Required) Character set."
}


##############################################################
#variables for alicloud_db_account_privilege
##############################################################

variable "account_name" {
  description = "A specified account name."
  default = ""
}

variable "privilege" {
  description = "The privilege of one account access database."
  default     = "ReadOnly"
}

variable "db_names" {
  description = "(Optional) List of specified database name."
  default     = []  
}

###############################################################
#variables for alicloud_db_backup_policy
##############################################################

variable "backup_period" {
  description = "(Optional) DB Instance backup period."
  default = []
}

variable "backup_time" {
  description = " (Optional) DB instance backup time, in the format of HH:mmZ- HH:mmZ. "
}

variable "retention_period" {
  description = "(Optional) Instance backup retention days. Valid values: [7-730]. Default to 7."
}

variable "log_backup" {
  description = "(Optional) Whether to backup instance log. Default to true."
}

variable "log_retention_period" {
  description = "(Optional) Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  default = 7
}

##############################################################
#variables for alicloud_db_connection
##############################################################

variable "connection_prefix" {
  description = "(Optional) Prefix of an Internet connection string. It must be checked for uniqueness. It may consist of lowercase letters, numbers, and underlines, and must start with a letter and have no more than 30 characters. Default to + 'tf'."
}

variable "port" {
  description = " (Optional) Internet connection port. Valid value: [3001-3999]. Default to 3306."
  default     = 3306
}


