terraform {
  source = "./"  # tells Terragrunt to run Terraform in this folder
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "my-terragrunt-demo-bucket"   # change: create an S3 bucket in AWS
    key            = "ec2-example/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"  # change: create DynamoDB table with LockID string key
  }
}


inputs = {
    instance_type = "t2.micro"
    instance_name = "Terragrunt-Demo"
}