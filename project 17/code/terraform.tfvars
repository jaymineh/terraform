region = "us-east-1"

vpc_cidr = "10.0.0.0/16" 

enable_dns_support = "true" 

enable_dns_hostnames = "true"  

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

tags = {
  Owner-Email = "jemine@iceglobalv.onmicrosoft.com"
  Managed-By  = "Terraform"
}

environment = "DEV"

ami = "ami-026ebd4cfe2c043b2"

keypair = "Jemine-EC4"

account_no = 894194274688

master-username = "admin"

master-password = "password"
