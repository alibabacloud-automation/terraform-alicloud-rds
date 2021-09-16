terraform-alicloud-rds
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[rds云数据库](https://help.aliyun.com/document_detail/26092.html). 

本 Module 支持创建以下资源:

* [云服务器rds实例_(db_instance)](https://www.terraform.io/docs/providers/alicloud/r/db_instance.html)
* [云服务器account实例_(db_account)](https://www.terraform.io/docs/providers/alicloud/r/db_account.html)
* [云服务器database实例_(db_database)](https://www.terraform.io/docs/providers/alicloud/r/db_database.html)
* [云服务器backup_policy实例_(db_backup_policy)](https://www.terraform.io/docs/providers/alicloud/r/db_backup_policy.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12。

## 用法

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

## 示例

* [Mysql 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/mysql)
* [PostSQL 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/postgre_sql)
* [PPAS 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/ppas)
* [SQL Server 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/sql_server)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


