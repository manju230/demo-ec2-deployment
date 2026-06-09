terraform {
  backend "s3" {
    bucket = "common-tf-statefiles"
    key    = "demo-ec2-deployment/ec2.tfstate"
    region = "ap-south-1"
  }
}

