provider "aws" {

   region = "ap-south-1"
}

locals {
  instance_t = "t2.micro"
  image = "ami-0ad21ae1d0696ad58"
}
data "aws_availability_zones" "available" {
  state = "available"
}

output "list_of_az" {
  value = data.aws_availability_zones.available.names
}

resource "aws_instance" "my_ec2" {
    count = length( data.aws_availability_zones.available.names )
    ami = "ami-0ad21ae1d0696ad58"
    availability_zone = element(data.aws_availability_zones.available.names,count.index)
    instance_type = "t2.micro"
    key_name = "gopal"
    tags = {

        name = "alok"
        value = "instance-${element(data.aws_availability_zones.available.names,count.index)}"
    }
}
