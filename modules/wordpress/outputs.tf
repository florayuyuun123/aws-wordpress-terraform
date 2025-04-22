# WordPress module outputs

output "public_ip" {
  description = "Public IP address of the WordPress instance"
  value       = aws_instance.wordpress.public_ip
}
