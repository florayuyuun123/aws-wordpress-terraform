# WordPress module variables

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets"
  type        = list(string)
}

variable "wordpress_sg_id" {
  description = "ID of the WordPress security group"
  type        = string
}

variable "efs_sg_id" {
  description = "ID of the EFS security group"
  type        = string
}

variable "db_endpoint" {
  description = "Endpoint of the RDS database"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Username for the database"
  type        = string
}

variable "db_password" {
  description = "Password for the database"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "Instance type for the WordPress EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "ami_id" {
  description = "ID of the AMI to use for the WordPress EC2 instance"
  type        = string
}

