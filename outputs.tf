# Project outputs

output "wordpress_public_ip" {
  description = "Public IP address of the WordPress instance"
  value       = module.wordpress.public_ip
}

output "wordpress_url" {
  description = "URL of the WordPress site"
  value       = "http://${module.wordpress.public_ip}"
}

output "db_endpoint" {
  description = "Endpoint of the RDS database"
  value       = module.database.db_endpoint
}