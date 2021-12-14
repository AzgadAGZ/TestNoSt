# terraform-aws-vpc
This module is used to create:
* VPC
* Subnet
* Security Groups Private and Public
* Nat Gateways
* Internet Gateways
* Route Table
* Route Table Associations
* Elastic IP

Example:
```terraform
module "vpc" {
source = "app.terraform.io/conekta-io/vpc/aws"
version = "0.0.1"
project = "microservices"
cidr_block = "10.30.0.0/16"

public_subnets = 3
private_subnets = 3

cost-center = "ENGINEERING"
team = "ENGINEERING"
environment   = "DEV"
pci-dss  = false
resource  = "VPC"
custom_ingress_public_security_group = {
"ssh-all" = {
from_port = "22",
to_port = "22",
protocol = "tcp",
cidr_blocks = ["0.0.0.0/0"],
description = "SSH - ALL"
},
"oracle-rds" = {
from_port = "1521",
to_port = "1521",
protocol = "tcp",
cidr_blocks = ["10.210.0.0/16"],
description = "ORACLE - RDS"
}
}
custom_ingress_private_security_group = {
"oracle-rds" = {
from_port = "1521",
to_port = "1521",
protocol = "tcp",
cidr_blocks = ["10.210.0.0/16"],
description = "ORACLE - RDS"
},
"vpc-networking" = {
from_port = "0",
to_port = "0",
protocol = "-1",
cidr_blocks = ["10.100.0.0/16"],
description = "VPC - NETWORKING"
}
}
}
```

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| project | Project name (e.g. `conekta`) | string | conekta | no |
| region | AWS Region | string | us-east-1 | no |
| vpc_name | VPC Name | string | vpc-conekta-[environment] | no |
| enabled | Create VPC resource | bool | true | no |
| environment | The Environment (e.g. `prod`, `dev`, `stg`, `qa`, `dce`). | string | - | yes |
| resource | The AWS Resource Name (e.g `eks`, `vpc`, `ALB`, `NLB`, `EIP`, `etc`) | string | - | yes |
| cost-center | Cost Center  (e.g. `ENGINEERING`, `FINANCE`) | string | ENGINEERING | no |
| team | Team Name | string | - | yes |
| terraform | Deployer | bool | true | no |
| pci-dss | PCI Compliance | bool | false | no |
| cidr_block | CIDR Block  (e.g. `10.0.0.0/16`) | string | - | yes |
| enable_dns_support | DNS Support | bool | true | no |
| enable_dns_hostnames | DNS Hostname Support | bool | true | no |
| instance_tenancy | Instance Tenancy | string | default | no |
| vpc_tags | Tags | map(any) | - | no |
| newbits | newbits | number | 8 | no |
| netnum | netnum | number | 100 | no |
| map_public_ip_on_launch | Public IP | bool | true | no |
| public_subnets | Number public subnets | number | 1 | no |
| public_subnets_identifier | Public Subnets Identifier | string | public | no |
| public_subnets_tags | Public Subnets Tags | map(any) | - | no |
| custom_ingress_public_security_group | Public Security Groups | map(object({ from_port = string, to_port = string, protocol = string, cidr_blocks = list(string), description = string })) | - | no |
| custom_ingress_private_security_group | Private Security Groups | map(object({ from_port = string, to_port = string, protocol = string, cidr_blocks = list(string), description = string })) | - | no |
| private_subnets | Number of Private Subnets | number | 0 | no |
| private_subnets_identifier | Private Subnets Identifier | string | private | no |
| private_subnets_tags | Private Subnets Tags | map(any) | - | no |

## Outputs

| Name | Description |
|------|-------------|
|vpc_id|The VPC ID|
|vpc_cidr|The VPC CIDR|
|public_subnet_ids|Public Subnets ID|
|private_subnet_ids|Private Subnets ID|
|private_security_group_id|Private Security Groups ID|
|public_security_group_id|Public Security Groups ID|