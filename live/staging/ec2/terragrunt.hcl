# Include root configuration
include "root" {
  path = find_in_parent_folders()
}

# Inputs to the module - Staging Environment
inputs = {
  region        = "us-east-1"
  instance_type = "t3.micro"                          # Small instance for staging
  instance_name = "staging-ec2-from-terragrunt"       # Staging-specific name
  ami_id        = "ami-08c40ec9ead489470"              # us-east-1 Amazon Linux 2
}
