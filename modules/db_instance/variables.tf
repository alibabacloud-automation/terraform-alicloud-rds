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
  description = "The list of switch ID to launch DB instances. If you need to create a Multi-AZ instance, this field must specify multiple ids, otherwise only one should be specified"
  default     = []
}

variable "security_ips" {
  description = " List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = list(string)
  default     = []
}

##############################################################
#variables for alicloud_db_connection
##############################################################

variable "instance_id" {
  description = "The Id of instance in which account belongs."
  default     = ""
}

variable "connection_prefix" {
  description = "Prefix of an Internet connection string. It must be checked for uniqueness. It may consist of lowercase letters, numbers, and underlines, and must start with a letter and have no more than 30 characters. Default to + 'tf'."
}

variable "port" {
  description = " Internet connection port. Valid value: [3001-3999]. Default to 3306."
  default     = 3306
}

###############################################################
#variables for alicloud_db_backup_policy
##############################################################

variable "backup_period" {
  description = "DB Instance backup period."
  type        = list(string)
  default     = []
}

variable "backup_time" {
  description = " DB instance backup time, in the format of HH:mmZ- HH:mmZ. "
}

variable "retention_period" {
  description = "Instance backup retention days. Valid values: [7-730]. Default to 7."
}

variable "log_backup" {
  description = "Whether to backup instance log. Default to true."
}

variable "log_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  default     = 7
}

