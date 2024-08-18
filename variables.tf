variable "instance_type" {
     type = string
     default = "t2.micro"
}

variable "image" {
     type = string
     default = "ami-0ad21ae1d0696ad58"
}

variable "public_subnet_cidr" {
     type = list(string)
     description = "Public Subnet"
     default = ["10.0.0.0/25","10.0.0.128/25"]
       
}

variable "azs" {
     type = list(string)
     default = [ "ap-south-1a", "ap-south-1b" ]

}
