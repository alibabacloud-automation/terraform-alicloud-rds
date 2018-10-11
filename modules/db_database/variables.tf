##############################################################
#variables for alicloud_db_database
##############################################################

variable "instance_id" {
  description = "The Id of instance in which database belongs."
  default = ""
}

variable "db_name" {
  description = "Name of the database requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 64 characters."
}

variable "character_set" {
  description = "Character set."
}

