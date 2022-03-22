#################
# Rds Instance
#################
variable "instance_name" {
  description = "The name of DB instance."
  type        = string
  default     = "tf-testacc-name"
}

variable "instance_storage" {
  description = "The storage capacity of the instance. Unit: GB. The storage capacity increases at increments of 5 GB. For more information, see [Instance Types](https://www.alibabacloud.com/help/doc-detail/26312.htm)."
  type        = number
  default     = 20
}

variable "instance_charge_type" {
  description = "The instance charge type. Valid values: Prepaid and Postpaid. Default to Postpaid."
  type        = string
  default     = "Postpaid"
}

variable "period" {
  description = "The duration that you will buy DB Instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. Default to 1"
  type        = number
  default     = 1
}

variable "security_ips" {
  description = " List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "sql_collector_status" {
  description = "The sql collector status of the instance. Valid values are `Enabled`, `Disabled`, Default to `Disabled`."
  type        = string
  default     = "Enabled"
}

variable "sql_collector_config_value" {
  description = "The sql collector keep time of the instance. Valid values are `30`, `180`, `365`, `1095`, `1825`, Default to `30`."
  type        = number
  default     = 30
}

variable "tags" {
  description = "A mapping of tags to assign to the mysql."
  type        = map(string)
  default = {
    Name = "RDS"
  }
}

#################
# Rds Backup policy
#################
variable "backup_retention_period" {
  description = "Instance backup retention days. Valid values: [7-730]. Default to 7."
  type        = number
  default     = 8
}

variable "log_backup_retention_period" {
  description = "Instance log backup retention days. Valid values: [7-730]. Default to 7. It can be larger than 'retention_period'."
  type        = number
  default     = 8
}

variable "preferred_backup_time" {
  description = " DB Instance backup time, in the format of HH:mmZ- HH:mmZ. "
  type        = string
  default     = "02:00Z-03:00Z"
}

variable "preferred_backup_period" {
  description = "DB Instance backup period."
  type        = list(string)
  default     = ["Monday", "Tuesday"]
}

variable "enable_backup_log" {
  description = "Whether to backup instance log. Default to true."
  type        = bool
  default     = true
}

#################
# Rds Database
#################
variable "description" {
  description = "Database description."
  type        = string
  default     = "tf-testacc-description"
}

#################
# Rds Database account
#################
variable "password" {
  description = "Operation database account password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters."
  type        = string
  default     = "YourPassword123!"
}