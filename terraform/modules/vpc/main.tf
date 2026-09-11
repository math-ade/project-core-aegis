resource "aws_vpc" "core_aegis" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "core-aegis-enterprise-vpc" }
}

resource "aws_subnet" "public_az1" {
  vpc_id            = aws_vpc.core_aegis.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "aegis-public-edge-1a" }
}

resource "aws_subnet" "private_az1" {
  vpc_id            = aws_vpc.core_aegis.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "aegis-isolated-app-1a" }
}

resource "aws_subnet" "private_az2" {
  vpc_id            = aws_vpc.core_aegis.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"
  tags              = { Name = "aegis-isolated-app-1b" }
}

output "vpc_id"          { value = aws_vpc.core_aegis.id }
output "private_subnets" { value = [aws_subnet.private_az1.id, aws_subnet.private_az2.id] }
