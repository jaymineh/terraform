terraform {
  backend "s3" {
    key = "terraform/jmntf.tfstate"
    bucket = "jmn-backend"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
  }

}
