#################
# Provider
#################
variable "region" {
  description = "The region used to launch this module resources."
  default     = ""
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

variable "create_database" {
  default = true
}

variable "create_account" {
  default = true
}
variable "db_instance_id" {
  description = "The Id of instance in which database belongs."
  default     = ""
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

variable "databases" {
  description = "add databases"
  type        = list(map(string))
  default     = []
}