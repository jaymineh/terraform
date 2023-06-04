provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "JMNvpc" {
 cidr_block = "192.168.0.0/24"

tags = {
  Name = var.vpcname
}
}

variable "vpcname" {
  type = string
}
