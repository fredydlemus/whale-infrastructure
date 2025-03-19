terraform {
  backend "s3" {
    bucket  = "terraform-state-whale-app"
    key     = "dev/state.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}