
provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terraform-vpc"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.ap-south-1.ssm"
  vpc_endpoint_type = "Interface"

  subnet_ids         = [aws_subnet.private.id]
  security_group_ids = [aws_security_group.endpoint.id]

  private_dns_enabled = true

  tags = {
    Name = "ssm-endpoint"
  }
}
