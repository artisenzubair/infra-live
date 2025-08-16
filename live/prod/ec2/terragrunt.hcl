# Include root configuration
include "root" {
  path = find_in_parent_folders()
}

# Inputs to the module - Production Environment
inputs = {
  region        = "us-east-1"
  instance_type = "t3.small"                      # Slightly larger instance for production
  instance_name = "prod-ec2-from-terragrunt"      # Production-specific name
  ami_id        = "ami-08c40ec9ead489470"          # us-east-1 Amazon Linux 2
}
