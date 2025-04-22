# S3 backend configuration

// Create the S3 bucket
# resource "aws_s3_bucket" "wp_terraform_state_bucket" {
#   bucket = "wpterraformstatebucket" // Specify the name of the bucket

#   tags = {
#     Name = "wp Terraform State Bucket"
#   }
# }

# Configure the backend to use the newly created S3 bucket
# terraform {
#   backend "s3" {
#     bucket = "wpterraformstatebucket"
#     key    = "wordpress/terraform.tfstate"
#     region = "us-east-1" # Specify the region where you created the new S3 bucket

#     encrypt = true
#   }
# }