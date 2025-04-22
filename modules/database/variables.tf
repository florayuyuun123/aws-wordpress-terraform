# Database module variables
variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of the private subnets"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "ID of the DB security group"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "wordpress"
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

variable "db_instance_class" {
  description = "Instance class for the database"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for the database in GB"
  type        = number
  default     = 20
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}