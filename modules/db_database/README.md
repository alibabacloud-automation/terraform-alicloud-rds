# alicloud_db_database

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|instance_id   | The Id of instance that can run database.   |  string     |     no      | yes |  
|name          | Name of the database requiring a uniqueness check. It may consist of lower case letters, numbers, and underlines, and must start with a letter and have no more than 64 characters.   |   string  |    no   |    yes       | 
|character_set | Character set. The value range is limited to the following:<br>MySQL: [ utf8, gbk, latin1, utf8mb4 ] (utf8mb4 only supports versions 5.5 and 5.6).<br>SQLServer: [ Chinese_PRC_CI_AS, Chinese_PRC_CS_AS, SQL_Latin1_General_CP1_CI_AS, SQL_Latin1_General_CP1_CS_AS, Chinese_PRC_BIN ]  |     string  |  no   |    yes       |  


## Outputs

| Name | Description |
|------|-------------|
| this_db_instance_databese_id    |      database ID created in this instance        |
| this_db_instance_databese_name    |     database name created in this instance         |
| this_db_instance_databese_account     |    database account associated in this instance          |
| this_db_instance_databese_accountprivilege     |    database account privilege associated in this instance         |
