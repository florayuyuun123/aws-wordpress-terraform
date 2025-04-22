# EFS file system
resource "aws_efs_file_system" "wordpress" {
  creation_token = "${var.project_name}-efs"
    
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  tags = {
    Name = "${var.project_name}-efs"
  }
}

resource "aws_efs_mount_target" "wordpress" {
  file_system_id = aws_efs_file_system.wordpress.id
  subnet_id = var.public_subnet_id
  security_groups = [var.efs_sg_id]
}

# EC2 instance for WordPress
resource "aws_instance" "wordpress" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.wordpress_sg_id]
  key_name               = var.key_name

  # Wait for EFS mount target to be available
  depends_on = [aws_efs_mount_target.wordpress]

  user_data = templatefile("${path.module}/templates/user_data.sh.tpl", {
    db_endpoint = var.db_endpoint
    db_name     = var.db_name
    db_username = var.db_username
    db_password = var.db_password
    efs_id      = aws_efs_file_system.wordpress.id
  })

  tags = {
    Name = "${var.project_name}-instance"
  }
}
