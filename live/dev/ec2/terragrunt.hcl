# Include root configuration
include "root" {
  path = find_in_parent_folders()
}


# 4) Inputs to the module
inputs = {
  region        = "us-east-1"
  instance_type = "t3.micro"
  instance_name = "dev-ec2-from-terragrunt"
  ami_id        = "ami-08c40ec9ead489470"  # us-east-1 Amazon Linux 2
}