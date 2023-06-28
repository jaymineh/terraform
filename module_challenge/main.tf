provider "aws" {
  region = "us-east-1"
}

module "webmodule" {
  source = "./web"
  ec2name = "Webserver"
}

output "web_output" {
  value = module.webmodule.instance_id
}

module "dbmodule" {
  source = "./db"
  ec2name = "Database"
}

output "db_output" {
    value = module.dbmodule.instance_id
}

output "web_IP" {
    value = module.webmodule.PublicIP
}

output "db_IP" {
  value = module.dbmodule.PrivateIP
}
