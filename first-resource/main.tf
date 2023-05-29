#provider "aws" {
#  region = "us-east-1"
#}

#resource "aws_vpc" "JMNvpc" {
# cidr_block = "18.0.0.0/24"
#}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "JMN" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
}