variable "region" {
  description = "The region used to launch this module resources."
  default     = "cn-beijing"
}
variable "creation" {
  default = "Rds"
}

variable "instance_id" {
  description = "The Id of instance in which database belongs."
  default     = ""
}

variable "db_name" {
  description = "Name of the database requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 64 characters."
  default     = "myTestDB"
}

variable "character_set" {
  description = "Select utf8, gbk, latin1 or utf8mb4"
  default     = "utf8"
}


variable "name" {
  description = "Operation account requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 16 characters."
  default     = "dbuser"
}

variable "password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  default     = "upw123"
}

variable "type" {
  description = "Privilege type of account.Normal: Common privilege. Super: High privilege.Default to Normal. It is is valid for MySQL 5.5/5.6 only."
  default     = "Normal"
}


variable "account_name" {
  description = "A specified account name."
  default     = "testaccount"
}

variable "privilege" {
  description = "The privilege of one account access database."
  default     = "ReadOnly"
}

variable "db_names" {
  description = "List of specified database name."
  type        = list(string)
  default     = []
}

variable "engine" {
  description = "The database engine to use"
  default     = "MySQL"
}

variable "engine_version" {
  description = "The engine version to use，Support mysql 5.5, 5.6, 5.7, 8.0 versions"
  default     = "5.7"
}

variable "instance_storage" {
  description = "The allocated storage in gigabytes"
  default     = "20"
}

variable "instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. fall list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = "rds.mysql.s2.large"
}

variable "instance_name" {
  description = " The name of DB instance. It a string of 2 to 256 characters"
  default     = "myTestInstance"
}

variable "instance_charge_type" {
  description = "Valid values are Prepaid, Postpaid, Default to Postpaid"
  default     = "Postpaid"
}

variable "period" {
  description = "The duration that you will buy DB instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. Default to 1"
  default     = 1
}

variable "zone_id" {
  description = "The Zone to launch the DB instance. "
}

variable "vpc_security_group_ids" {
  description = "List of VPC security groups to associate"
  type        = list(string)
  default     = []
}

variable "vswitch_id" {
  description = "The virtual switch ID to launch DB instances in one VPC."
  default     = ""
}

variable "security_ips" {
  description = " List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = list(string)
  default     = []
}

variable "connection_prefix" {
  description = "Prefix of an Internet connection string. It must be checked for uniqueness. It may consist of lowercase letters, numbers, and underlines, and must start with a letter and have no more than 30 characters. Default to + 'tf'."
  type        = string
  default     = "testmysql"
}

variable "port" {
  description = " Internet connection port. Valid value: [3001-3999]. Default to 3306."
  default     = 3306
}

variable "backup_period" {
  description = "DB Instance backup period."
  type        = list(string)
  default     = []
}

variable "backup_time" {
  description = " DB instance backup time, in the format of HH:mmZ- HH:mmZ. "
  default     = "02:00Z-03:00Z"
}

variable "retention_period" {
  description = "Instance backup retention days. Valid values: [7-730]. Default to 7."
  default     = 7
}

variable "log_backup" {
  description = "Whether to backup instance log. Default to true."
  default     = true
}

variable "log_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  default     = 7
}
#append
variable "new_database" {
  description = "Create DB.default to true"
  default     = true
}
variable "new_instance" {
  description = "Create instance.default to true"
  default     = true
}
variable "new_account" {
  description = "Create account.default to true"
  default     = true
}
variable "new_privilege" {
  description = "Adding DB ReadOnly privilege.default to true"
  default     = true
}
variable "new_backup_policy" {
  description = "Adding DB backup policy.default to true"
  default     = true
}
variable "new_db_readonly_instance" {
  description = "Adding DB  DB readonly instance.default to true"
  default     = true
}

variable "readonly_engine" {
  description = "The database engine to use"
  default     = "MySQL"
}

variable "readonly_engine_version" {
  description = "The engine version to use"
  default     = "5.7"
}

variable "readonly_instance_storage" {
  description = "The allocated storage in gigabytes"
  default     = "20"
}

variable "readonly_instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. fall list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = "rds.mysql.s2.large"
}
variable "readonly_zone_id" {
  description = "The Zone to launch the DB instance. "
  default     = "cn-beijing-h"
}
variable "database_list" {
  description = "add databases"
  type        = list(map(string))
  default     = []
}
variable "db_description" {
  description = "Description of the database"
  default     = ""
}
variable "db_character_set" {
  description = "Character set."
  default     = "utf8"
}
variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  default     = false
}


variable "security_group_name_regex" {
  description = "A regex string to filter security groups by name."
  default     = ""
}

variable "vswitch_resource_group_id" {
  description = "A id string to filter vswitches by resource group id."
  default     = ""
}

variable "vswitch_tags" {
  description = "A mapping of tags to filter vswitches by tags."
  type        = map(string)
  default     = {}
}

variable "vswitch_name_regex" {
  description = "A regex string to filter vswitches by name."
  default     = ""
}
variable "new_connection" {
  description = "Adding db connections"
  default     = false
}
variable "connection_list" {
  description = "add connection"
  type        = list(map(string))
  default     = []
}
variable "vswitch_ids" {
  description = "A list of virtual switch IDs to launch in."
  type        = list(string)
  default     = []
}