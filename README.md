# Alicloud RDS Instance Terraform Module 

A terraform module to provide RDS instances in Alicloud VPC. Its input variables contains Instance ID, Instance Name, Connecting String, Database name, Datebase user account and so on. 

It assumes you have one VPC and VSwitch and you want to put the new instances to the VPC. If not, you can launch a new one by module terraform-alicloud-vpc.


## You can use this in your terraform template with the following steps.


#### 1. Adding the module resource to your template:
    
    terraform get ./modules/db_instance

#### 2. Using module in you tf file like below (as shown in demo.tf):

#### Usage:

```hcl
module "rds" {
  #source = "terraform-alicloud-modules/rds/alicloud"
  source = "./database"

###############################################################
#variables for db instance
##############################################################

  engine                       = "MySQL"
  engine_version               = "5.7"
  instance_type                = "mysql.n1.micro.1"
  instance_storage             = "20"
  instance_name                = "myTestDBInstance"
  instance_charge_type         = "Postpaid"
  zone_id                      = "cn-hangzhou-f"
  security_ips                 = ["11.193.54.0/24","101.37.74.0/24","10.137.42.0/24","121.43.18.0/24"]


###############################################################
#variables for db account
##############################################################
  name                         = "dbuser"
  password                     = "testUser123"
  type                         = "Normal"

##############################################################
#variables for account_privilege
##############################################################

  privilege                    = "ReadWrite"

###############################################################
#variables for database
##############################################################
  db_name = "tf_database"
  character_set = "utf8"

###############################################################
#variables for backup
##############################################################
  backup_period                = ["Monday", "Wednesday"]
  backup_time                  = "02:00Z-03:00Z"
  retention_period             = 7
  log_backup                   = true
  log_retention_period         = 7

}
```

#### 3. you can use output to display the results:
#### Usage:

```hcl
output "db_instance_id" {
  value       = "${module.rds.db_instance_id}"
}

output "this_db_instance_engine" {
  value       = "${module.rds.this_db_instance_engine}"
}

output "this_db_instance_engine_version" {
  value       = "${module.rds.this_db_instance_engine_version}"
}

output "this_db_instance_instance_name" {
  value       = "${module.rds.this_db_instance_instance_name}"
}

output "this_db_instance_zone_id" {
  value       = "${module.rds.this_db_instance_zone_id}"
}

output "this_db_instance_connection_string" {
  value       = "${module.rds.this_db_instance_connection_string}"
}

output "this_db_instance_port" {
  value       = "${module.rds.this_db_instance_port}"
}

output "this_db_instance_security_ips" {
  value       = "${module.rds.this_db_instance_security_ips}"
}

output "this_db_databese_id" {
  value       = "${module.rds.this_db_databese_id}"
}

output "this_db_databese_name" {
  value       = "${module.rds.this_db_databese_name}"
}

output "this_db_databese_account" {
  value       = "${module.rds.this_db_databese_account}"
}

output "this_db_databese_accountprivilege" {
  value       = "${module.rds.this_db_databese_accountprivilege}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|engine               | Database type. Value options: MySQL, SQLServer, PostgreSQL, and PPAS.    |  string     |     MySQL      | yes |  
|engine_version       | Database version. Value options: >5.5/5.6/5.7 for MySQL ; >2008r2/2012 for SQLServer ;>9.4/10.0 for PostgreSQL ;>9.3 for PPAS   |   string  |    5.7    |    yes       | 
|instance_type        | DB Instance type. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm).   |     string  |  mysql.n1.micro.1   |    yes       |  
|instance_storage     | User-defined DB instance storage space. Value range: >[5, 2000] for MySQL/PostgreSQL/PPAS HA dual node edition; >[20,1000] for MySQL 5.7 basic single node edition; >[10, 2000] for SQL Server 2008R2; >[20,2000] for SQL Server 2012 basic single node edition Increase progressively at a rate of 5 GB. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm).   |    string   |     20      |     yes      | 
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


## Authors
---------
Created and maintained by Yongjin Yan(@YongjinYan, yanyongjin@gmail.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

