variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
  type = list(string)
  default = ["value1","value2"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "JMNvpc" {
 cidr_block = "18.0.0.0/24"

 tags = {
   Name = var.inputname
 }
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

output "vpcid" {
    value = aws_vpc.JMNvpc.id
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "JMN"
        port = [22, 25, 80]
    }
}
