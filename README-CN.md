terraform-alicloud-rds
=====================================================================

本 Module 用于在阿里云的 VPC 下创建一个[rds云数据库](https://help.aliyun.com/document_detail/26092.html). 

本 Module 支持创建以下资源:

* [云服务器rds实例_(db_instance)](https://www.terraform.io/docs/providers/alicloud/r/db_instance.html)
* [云服务器account实例_(db_account)](https://www.terraform.io/docs/providers/alicloud/r/db_account.html)
* [云服务器database实例_(db_database)](https://www.terraform.io/docs/providers/alicloud/r/db_database.html)
* [云服务器backup_policy实例_(db_backup_policy)](https://www.terraform.io/docs/providers/alicloud/r/db_backup_policy.html)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## 用法

```hcl
module "mysql" {
  source  = "terraform-alicloud-modules/rds/alicloud"
  
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
本Module从版本v2.4.0开始已经移除掉如下的 provider 的显式设置：
```hcl
provider "alicloud" {
  version = ">=1.64.0"
  profile = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region = var.region != "" ? var.region : null
  skip_region_validation = var.skip_region_validation
  configuration_source = "terraform-alicloud-modules/rds"
} 
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 2.3.0:

```hcl
module "rds" {
  source  = "terraform-alicloud-modules/rds/alicloud"
  version     = "2.3.0"
  region      = "cn-hangzhou"
  profile     = "Your-Profile-Name"

  engine            = "MySQL"
  engine_version    = "8.0"
}
```
如果你想对正在使用中的Module升级到 2.4.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
}
module "rds" {
  source  = "terraform-alicloud-modules/rds/alicloud"
  engine            = "MySQL"
  engine_version    = "8.0"
}
```
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

```hcl
provider "alicloud" {
  region  = "cn-hangzhou"
  profile = "Your-Profile-Name"
  alias   = "hz"
}
module "rds" {
  source  = "terraform-alicloud-modules/rds/alicloud"
  providers = {
    alicloud = alicloud.hz
  }
  engine            = "MySQL"
  engine_version    = "8.0"
}
```

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

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