provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/24"
    tags = {
      name = "demo vpc"
    }
}

resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)
}