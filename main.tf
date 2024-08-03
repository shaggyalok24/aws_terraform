provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
    ami = "ami-06489866022e12a14"
    instance_type = "t2.micro"
    key_name = "gopal"
    tags = {

        name = "alok"
        value = 1
    }
}

resource "aws_s3_bucket" "terabucket" {

 bucket = "terabucket" 
 tags = {
    name = "practice"
 }
}
