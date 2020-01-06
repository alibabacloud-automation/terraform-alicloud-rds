# Alibaba Cloud RDS example for MySQL Databases

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
| this_db_description     |        databases's description     |
| this_db_instance_database_id    |      database ID created in this instance        |
| this_db_instance_database_name    |     database name created in this instance         |
| this_db_instance_database_account     |    database account associated in this instance          |
| this_db_instance_database_accountprivilege     |    database account privilege associated in this instance         |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
