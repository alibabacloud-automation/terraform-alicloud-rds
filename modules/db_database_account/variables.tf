
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
  description = "List of specified database name."
  type = "list"
  default     = []  
}
