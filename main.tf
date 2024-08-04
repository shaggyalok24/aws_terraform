provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
    ami = var.ami_id.default
    instance_type = var.instance_type.default
    key_name = "gopal"
    tags = {

        name = "alok"
        value = 1
    }
}

resource "aws_s3_bucket" "bucket-1aa" {

 bucket = "firstbucket-aa" 
 tags = {
    name = "practice"
 }
}

output "mys3" {
    value = aws_s3_bucket.bucket-1aa
}
