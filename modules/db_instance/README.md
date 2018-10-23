# alicloud_db_instance

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
