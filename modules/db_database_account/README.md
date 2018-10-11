# alicloud_db_account

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|instance_id   | The Id of instance that can run database.   |  string     |     no      | yes |  
|name          | Operation account requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 16 characters.   |   string  |    no   |    yes       | 
|password |  Operation password. It may consist of letters, digits, or underlines, with a length of 6 to 32 characters.  |     string  |  no   |    yes       |  
|type | Privilege type of account.<br>Normal: Common privilege.<br>Super: High privilege. |     string  |  no   |    yes       |  


## Outputs

| Name | Description |
|------|-------------|
| this_db_instance_databese_account     |    database account associated in this instance          |
| this_db_instance_databese_accountprivilege     |    database account privilege associated in this instance         |
