# Networking module variables

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zone" {
  description = "Availability zone for the public subnet"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones for private subnets"
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}