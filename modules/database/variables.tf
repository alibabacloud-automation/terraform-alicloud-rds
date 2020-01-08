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
  type        = bool
  default     = false
}
#################
# Rds Database
#################
variable "create_database" {
  description = "Whether to create multiple databases. If true, the `databases` should not be empty."
  type        = bool
  default     = true
}
variable "databases" {
  description = "A list mapping used to add multiple databases. Each item supports keys: name, character_set and description. It should be set when create_database = true."
  type        = list(map(string))
  default     = []
}
#################
# Rds Database account
#################
variable "create_account" {
  description = "Whether to create a new account. If true, the `account_name` should not be empty."
  type        = bool
  default     = true
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

variable "db_instance_id" {
  description = "The Id of instance in which database belongs."
  default     = ""
}


