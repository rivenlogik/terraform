provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "aws-tf-state"
    key     = "global/s3/terraform.tfstate"
    region  = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "aws-tf-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}
