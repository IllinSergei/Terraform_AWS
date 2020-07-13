provider "aws" {
  region              = "eu-central-1"
 }


data "aws_availability_zones" "working" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "my_vpcs" {}

data  "aws_vpc" "prod_vpc" {
  tags = {
    Name = "prod"
  }
}
resource "aws_subnet" "prod_subnet_1" {
  vpc_id = data.aws_vpc.prod_vpc.id
  availability_zone = data.aws_availability_zones.working.names[0]
}




output "prod_vpc_id" {
  value = data.aws_vpc.prod_vpc.id
}
output "prod_vpc_CIDR" {
  value = data.aws_vpc.prod_vpc.cidr_block
}


output "aws_availability_zones" {
  value = data.aws_availability_zones.working.names
}
output "aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}
output "aws_region_name" {
  value = data.aws_region.current.name
}
output "aws_region_description" {
  value = data.aws_region.current.description
}
output "aws_vpcs" {
  value = data.aws_vpcs.my_vpcs.ids
}