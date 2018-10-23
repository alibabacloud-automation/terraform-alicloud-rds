Alicloud RDS Instance Terraform Module   
terraform-alicloud-rds
---

This Terraform module will first creates a RDS instance, then create and associate a database and DB account to this instance.
Also you can config the backup policy of instance created on Alibaba Cloud.

These types of resources are supported:

* [Alicloud_db_instance](https://www.terraform.io/docs/providers/alicloud/r/db_instance.html)
* [Alicloud_db_account](https://www.terraform.io/docs/providers/alicloud/r/db_account.html)
* [Alicloud_db_database](https://www.terraform.io/docs/providers/alicloud/r/db_database.html)
* [Alicloud_db_backup_policy](https://www.terraform.io/docs/providers/alicloud/r/db_backup_policy.html)

----------------------


Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf
    
```hcl
module "rds" {
  source = "terraform-alicloud-modules/rds/alicloud"

  #variables for db instance
  
  engine                       = "MySQL"
  engine_version               = "5.7"
  instance_type                = "mysql.n1.micro.1"
  instance_storage             = "20"
  instance_name                = "myTestDBInstance"
  instance_charge_type         = "Postpaid"
  zone_id                      = "cn-hangzhou-f"
  security_ips                 = ["11.193.54.0/24","101.37.74.0/24","10.137.42.0/24","121.43.18.0/24"]

  #variables for db account
  
  name                         = "dbuser"
  password                     = "testUser123"
  type                         = "Normal"

  #variables for account_privilege

  privilege                    = "ReadWrite"

  #variables for database

  db_name                      = "tf_database"
  character_set                = "utf8"

  #variables for backup

  backup_period                = ["Monday", "Wednesday"]
  backup_time                  = "02:00Z-03:00Z"
  retention_period             = 7
  log_backup                   = true
  log_retention_period         = 7

}
```

2. Setting `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|engine               | Database type. Value options: MySQL, SQLServer, PostgreSQL, and PPAS.    |  string     |     MySQL      | yes |  
|engine_version       | Database version. Value options:<br>5.5/5.6/5.7 for MySQL ;<br>2008r2/2012 for SQLServer; <br>9.4/10.0 for PostgreSQL; <br>9.3 for PPAS   |   string  |    5.7    |    yes       | 
|instance_type        | DB Instance type. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm).   |     string  |  mysql.n1.micro.1   |    yes       |  
|instance_storage     | User-defined DB instance storage space. Value range:<br>[5, 2000] for MySQL/PostgreSQL/PPAS HA dual node edition;<br>[20,1000] for MySQL 5.7 basic single node edition;<br>[10, 2000] for SQL Server 2008R2;<br>[20,2000] for SQL Server 2012 basic single node edition Increase progressively at a rate of 5 GB. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm).   |    string   |     20      |     yes      | 
|instance_name        | The name of DB instance. It a string of 2 to 256 characters.    |  string     |     myTestDBInstance      |    no       | 
|instance_charge_type | Valid values are Prepaid, Postpaid, Default to Postpaid.  |  string     |     Postpaid      |     no      |  = "Postpaid"
|zone_id              | The Zone to launch the DB instance. From version 1.8.1, it supports multiple zone. If it is a multi-zone and vswitch_id is specified, the vswitch must in the one of them. The multiple zone ID can be retrieved by setting multi to "true" in the data source alicloud_zones.  |  string     |     cn-hangzhou-b      |   no        |  
|security_ips         | List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32]).    |   list    |    []      |      no     |  


## Outputs

| Name | Description |
|------|-------------|
| this_db_instance_id     |        instance ID created     |
| this_db_instance_engine     |    instance engine created         |
| this_db_instance_engine_version     |   instance engine version created          |
| this_db_instance_instance_name     |     instance name created        |
| this_db_instance_instance_type     |      instance type created       |
| this_db_instance_zone_id     |       instance zone ID created      |
| this_db_instance_connection_string     |     intance public net connection string created        |
| this_db_instance_port     |     instance connection port created         |
| this_db_instance_security_ips     |    instance security ips configured         |
| this_db_instance_databese_id    |      database ID created in this instance        |
| this_db_instance_databese_name    |     database name created in this instance         |
| this_db_instance_databese_account     |    database account associated in this instance          |
| this_db_instance_databese_accountprivilege     |    database account privilege associated in this instance         |


Authors
---------
Created and maintained by Yongjin Yan(@YongjinYan, yanyongjin@gmail.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
