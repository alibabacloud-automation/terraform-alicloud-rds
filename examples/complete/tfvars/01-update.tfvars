#################
# Rds Instance
#################
instance_name        = "update-tf-testacc-name"
instance_storage     = 25
period               = 2
security_ips         = ["10.23.12.24"]
sql_collector_status = "Disabled"
tags = {
  Name = "updateRDS"
}

#################
# Rds Backup policy
#################
backup_retention_period     = 9
log_backup_retention_period = 9
preferred_backup_time       = "01:00Z-02:00Z"
preferred_backup_period     = ["Tuesday", "Wednesday"]
enable_backup_log           = false

#################
# Rds Database
#################
description = "update-tf-testacc-description"

#################
# Rds Database account
#################
password = "YourPassword123!update"