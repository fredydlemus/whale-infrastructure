terraform {
  backend "s3" {
    bucket = ""
    key    = "ecr/terraform.tfstate"
    region = "us-east-1"
  }
}