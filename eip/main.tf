resource "aws_instance" "ec2" {
    ami = "ami-026ebd4cfe2c043b2"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticEIP" {
  instance = aws_instance.ec2.id
}

output "EIP" {
  value = aws_eip.elasticEIP.public_ip 
}
