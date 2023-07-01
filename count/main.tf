provider "aws" {
    region = "us-east-1"  
}

module "db" {
  source = "./db"
  server_names = ["mariadb","mysql","mssql"]
}

output "private_ip" {
  value = module.db.PrivateIP
}
