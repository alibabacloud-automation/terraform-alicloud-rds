#################
# Provider
#################
variable "region" {
  description = "(Deprecated from version 2.4.0)The region used to launch this module resources."
  default     = ""
}
variable "profile" {
  description = "(Deprecated from version 2.4.0)The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  default     = ""
}
variable "shared_credentials_file" {
  description = "(Deprecated from version 2.4.0)This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  default     = ""
}
variable "skip_region_validation" {
  description = "(Deprecated from version 2.4.0)Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#################
# Rds Instance
#################
variable "instance_name" {
  description = "The name of DB instance. A random name prefixed with 'terraform-rds-' will be set if it is empty."
  default     = ""
}
variable "instance_charge_type" {
  description = "The instance charge type. Valid values: Prepaid and Postpaid. Default to Postpaid."
  default     = "Postpaid"
}
variable "instance_storage" {
  description = "The storage capacity of the instance. Unit: GB. The storage capacity increases at increments of 5 GB. For more information, see [Instance Types](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  type        = number
  default     = 20
}
variable "instance_type" {
  description = "DB Instance type, for example: mysql.n1.micro.1. full list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = ""
}
variable "security_group_ids" {
  description = "List of VPC security group ids to associate with rds instance."
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
variable "tags" {
  description = "A mapping of tags to assign to the rds."
  type        = map(string)
  default     = {}
}
variable "instance_storage_type" {
  description = "The storage type of the instance"
  default     = "local_ssd"
}
variable "sql_collector_status" {
  description = "The sql collector status of the instance. Valid values are `Enabled`, `Disabled`, Default to `Disabled`."
  type        = string
  default     = "Disabled"
}
variable "sql_collector_config_value" {
  description = "The sql collector keep time of the instance. Valid values are `30`, `180`, `365`, `1095`, `1825`, Default to `30`."
  type        = number
  default     = 30
}

#################
# Rds Backup policy
#################
variable "preferred_backup_period" {
  description = "DB Instance backup period."
  type        = list(string)
  default     = []
}
variable "preferred_backup_time" {
  description = " DB instance backup time, in the format of HH:mmZ- HH:mmZ. "
  default     = "02:00Z-03:00Z"
}
variable "backup_retention_period" {
  description = "Instance backup retention days. Valid values: [7-730]. Default to 7."
  type        = number
  default     = 7
}
variable "enable_backup_log" {
  description = "Whether to backup instance log. Default to true."
  type        = bool
  default     = false
}
variable "log_backup_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  type        = number
  default     = 7
}

#################
# Rds Connection
#################
variable "allocate_public_connection" {
  description = "Whether to allocate public connection for a RDS instance. If true, the connection_prefix can not be empty."
  type        = bool
  default     = true
}
variable "connection_prefix" {
  description = "Prefix of an Internet connection string. A random name prefixed with 'tf-rds-' will be set if it is empty."
  type        = string
  default     = ""
}
variable "port" {
  description = " Internet connection port. Valid value: [3001-3999]. Default to 3306."
  type        = number
  default     = 3306
}

#################
# Rds Database account
#################
variable "create_account" {
  description = "Whether to create a new account. If true, the `account_name` should not be empty."
  type        = bool
  default     = false
}
variable "account_name" {
  description = "Name of a new database account. It should be set when create_account = true."
  default     = ""
}
variable "password" {
  description = "Operation database account password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  default     = ""
}
variable "type" {
  description = "Privilege type of account. Normal: Common privilege. Super: High privilege.Default to Normal."
  default     = "Normal"
}
variable "privilege" {
  description = "The privilege of one account access database."
  default     = "ReadOnly"
}

#################
# Rds Database
#################
variable "create_database" {
  description = "Whether to create multiple databases. If true, the `databases` should not be empty."
  type        = bool
  default     = false
}
variable "databases" {
  description = "A list mapping used to add multiple databases. Each item supports keys: name, character_set and description. It should be set when create_database = true."
  type        = list(map(string))
  default     = []
}
