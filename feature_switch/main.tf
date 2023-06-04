provider "aws" {
  region = "us-east-1"
}

variable "environment" {
  type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
    count = var.environment == "prod" ? 1 : 0
}
