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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0

## Usage

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

## Examples

* [Mysql example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/mysql)
* [PostSQL example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/postgre_sql)
* [PPAS example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/ppas)
* [SQL Server example](https://github.com/terraform-alicloud-modules/terraform-alicloud-rds/tree/master/examples/sql_server)

## Notes
From the version v2.4.0, the module has removed the following `provider` setting:

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

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 2.3.0:

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

If you want to upgrade the module to 2.4.0 or higher in-place, you can define a provider which same region with
previous region:

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
or specify an alias provider with a defined region to the module using `providers`:

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

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.
More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

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