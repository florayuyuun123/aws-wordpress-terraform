output "db_endpoint" {
  description = "Endpoint of the RDS database"
  value       = aws_db_instance.db_wordpress.endpoint
}

output "db_name" {
  description = "Name of the database"
  value       = var.db_name
}

output "db_username" {
  description = "Username for the database"
  value       = var.db_username
}