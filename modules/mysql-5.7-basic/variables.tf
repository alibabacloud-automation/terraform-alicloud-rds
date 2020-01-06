
variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
}
variable "character_set" {
  description = "Select utf8, gbk, latin1 or utf8mb4"
  default     = "utf8"
}

variable "password" {
  description = "Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  default     = ""
}

variable "account_name" {
  description = "Name of a new database account. It should be set when create_account = true."
  default     = ""
}

variable "privilege" {
  description = "The privilege of one account access database."
  default     = "ReadOnly"
}

variable "instance_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "instance_type" {
  description = "DB Instance type, full list is : https://www.alibabacloud.com/help/zh/doc-detail/26312.htm"
  default     = ""
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
  type        = number
  default     = 1
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
  default     = ""
}

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
variable "log_backup_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  type        = number
  default     = 7
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
  type        = bool
  default     = false
}
variable "databases" {
  description = "A list mapping used to add multiple databases. Each item supports keys: name, character_set and description."
  type        = list(map(string))
  default     = []
}
variable "instance_storage_type" {
  description = "The storage type of the instance"
  default     = "cloud_ssd"
}
