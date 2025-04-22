# Main terraform configuration file

module "networking" {
  source = "./modules/networking"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zone    = var.availability_zone
  availability_zones   = var.availability_zones
  project_name         = var.project_name
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id       = module.networking.vpc_id
  project_name = var.project_name
}

module "database" {
  source = "./modules/database"

  db_subnet_group_name = module.networking.db_subnet_group_name
  private_subnet_ids   = module.networking.private_subnet_ids
  db_security_group_id = module.security_groups.db_security_group_id
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  project_name         = var.project_name
  identifier           = var.project_name
}

module "wordpress" {
  source = "./modules/wordpress"

  public_subnet_id   = module.networking.public_subnet_id
  ami_id             = var.ami_id
  private_subnet_ids = module.networking.private_subnet_ids 
  wordpress_sg_id    = module.security_groups.wordpress_sg_id
  efs_sg_id          = module.security_groups.efs_sg_id
  db_endpoint        = module.database.db_endpoint
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  instance_type      = var.instance_type
  key_name           = var.key_name
  project_name       = var.project_name
}