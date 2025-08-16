terraform {
  source = "git::https://github.com/artisenzubair/tf-mod-ec2.git"
  # e.g., to pin to a tag, use:
  # source = "git::https://github.com/artisenzubair/tf-mod-ec2.git?ref=v0.1.0"
}

# Generate backend block inside the working dir Terraform runs in
generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite"
  contents  = <<EOF
terraform {
  backend "s3" {}
}
EOF
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terragrunt-demo-bucket"   # change: create an S3 bucket in AWS
    key            = "staging/ec2/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"  # change: create DynamoDB table with LockID string key
  }
}

# Inputs to the module - Staging Environment
inputs = {
  region        = "us-east-1"
  instance_type = "t3.micro"                          # Small instance for staging
  instance_name = "staging-ec2-from-terragrunt"       # Staging-specific name
  ami_id        = "ami-08c40ec9ead489470"              # us-east-1 Amazon Linux 2
}
