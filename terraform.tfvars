# Sample terraform.tfvars file

region               = "us-east-1"
project_name         = "wordpress-project"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidr   = "10.0.1.0/24"
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone    = "us-east-1a"
availability_zones   = ["us-east-1a", "us-east-1b"]
instance_type        = "t3.medium"
key_name             = ""
db_name              = "db_wordpress"
db_username          = "admin"
identifier           = "wordpress-project"
db_password          = "" # Use a secure password in production
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
ami_id               = ""
