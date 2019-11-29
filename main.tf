# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-bucket-vino123"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "us-east-1"
}

# Create EC2 instance
resource "aws_instance" "MyTest" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name = "jen_key"
  
  
  tags = {
    terraform = "true"
    env       = "Dev"
    Name      = "My First Server"
  }
  root_block_device  {
      volume_type = "gp2"
      volume_size = 25
  }
}
