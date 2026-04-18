resource "aws_vpc" "devops-vpc" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  tags = {
    name = "devops-vpc"
  }
}
