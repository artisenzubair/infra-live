# Root Terragrunt configuration
# This file contains common configuration shared across all environments

# Common remote state configuration
remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terragrunt-demo-bucket"   # change: create an S3 bucket in AWS
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"  # change: create DynamoDB table with LockID string key
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Common Terraform configuration
terraform {
  source = "git::https://github.com/artisenzubair/tf-mod-ec2.git"
  # e.g., to pin to a tag, use:
  # source = "git::https://github.com/artisenzubair/tf-mod-ec2.git?ref=v0.1.0"
}

# Generate provider configuration
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = var.region
}
EOF
}
