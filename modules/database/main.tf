resource "aws_db_instance" "db_wordpress" {
  allocated_storage    = var.db_allocated_storage
  identifier           = var.project_name
  engine               = "mysql"
  engine_version       = "8.0.40"
  instance_class       = var.db_instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.db_security_group_id]

  tags = {
    Name = "${var.project_name}-db"
  }
}