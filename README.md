Alibaba Cloud RDS Instance Terraform Module  
terraform-alicloud-rds
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/blob/master/README-CN.md)

Terraform module which creates RDS instance(s) on Alibaba Cloud. 

These types of resources are supported:

* [Alicloud_db_instance](https://www.terraform.io/docs/providers/alicloud/r/db_instance.html)
* [Alicloud_db_account](https://www.terraform.io/docs/providers/alicloud/r/db_account.html)
* [Alicloud_db_database](https://www.terraform.io/docs/providers/alicloud/r/db_database.html)
* [Alicloud_db_backup_policy](https://www.terraform.io/docs/providers/alicloud/r/db_backup_policy.html)

## Terraform versions

This module requires Terraform 0.12.

## Usage

```hcl

module "mysql" {
  source  = "terraform-alicloud-modules/rds/alicloud"
  profile = "Your-Profile-Name"
  region  = "cn-beijing"
  
  engine            = "MySQL"
  engine_version    = "8.0"
  connection_prefix = "developmentabc"
  vswitch_id        = "vsw-bp1tili2u5kpgdk84osjk"
  instance_storage  = 20
  period            = 1
  instance_type     = "rds.mysql.s2.large"
  instance_name     = "myDBInstance"
  instance_charge_type       = "Postpaid"
  security_ips = [
    "11.193.54.0/24",
    "121.43.18.0/24"
    ]
    
  tags = {
    Created      = "Terraform"
    Environment = "dev"
  }
  
  ###############
  #backup_policy#
  ###############
  preferred_backup_period     = ["Monday", "Wednesday"]
  preferred_backup_time       = "00:00Z-01:00Z"
  backup_retention_period     = 7
  log_backup_retention_period = 7
  enable_backup_log           = true
  
  ###########
  #databases#
  ###########
  account_name = "account_name1"
  password     = "1234abc"
  type         = "Normal"
  privilege    = "ReadWrite"
  databases = [
    {
      name          = "dbuserv1"
      character_set = "utf8"
      description   = "db1"
    },
    {
      name          = "dbuserv2"
      character_set = "utf8"
      description   = "db2"
    },
  ]
}
```

## Examples

* [Mysql example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/mysql)
* [PostSQL example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/postgre_sql)
* [PPAS example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/ppas)
* [SQL Server example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/sql_server)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


