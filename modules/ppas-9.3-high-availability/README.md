# PPAS-9.3-HighAvailability Alibaba Cloud Rds Terraform Module

Configuration in this directory creates set of RDS resources including DB instance, DB account and Datebase.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

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
| this_db_instance_database_id    |      database ID created in this instance        |
| this_db_instance_database_name    |     database name created in this instance         |
| this_db_instance_database_account     |    database account associated in this instance          |
| this_db_instance_database_accountprivilege     |    database account privilege associated in this instance         |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
