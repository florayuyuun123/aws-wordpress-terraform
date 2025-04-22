# Security Groups module outputs

output "wordpress_sg_id" {
  description = "ID of the WordPress security group"
  value       = aws_security_group.wordpress.id
}

output "db_security_group_id" {
  description = "ID of the database security group"
  value       = aws_security_group.database.id
}

output "efs_sg_id" {
  description = "ID of the EFS security group"
  value       = aws_security_group.efs.id
}