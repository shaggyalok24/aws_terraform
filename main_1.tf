provider "aws" {

   region = "ap-south-1"
}

data "aws_availability_zones" "available" {
    state = "available"
}

output "list_of_az" {
  value = data.aws_availability_zones.available.names
}

resource "aws_instance" "my_ec2" {
    count = length( data.aws_availability_zones.available.names )
    ami = var.image.default
    availability_zone = element(data.aws_availability_zones.available.names,count.index)
    instance_type = var.instance_type.default
    key_name = "gopal"
    tags = {

        name = "alok"
        value = "instance-${element(data.aws_availability_zones.available.names,count.index)}"
    }
}
