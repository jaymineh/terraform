variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}

variable "ingress" {
  type = list(number)
  default = [80,443]
}

variable "egress" {
  type = list(number)
  default = [80,443]
}

resource "aws_security_group" "web_traffic" {
  name = "Allow DB Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db.*.private_ip
}

output "instance_id" {
  value = aws_instance.db.*.id
}
