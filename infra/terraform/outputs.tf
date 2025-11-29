
output "server_public_ip" {
  description = "Public IP of the server"
  value       = aws_eip.app_eip.public_ip
}

output "server_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app_server.id
}

output "security_group_id" {
  description = "Security group ID"
  value       = aws_security_group.app_sg.id
}

output "application_url" {
  description = "Application URL"
  value       = "https://${var.domain_name}"
}

output "ssh_command" {
  description = "SSH command to connect to server"
  value       = "ssh -i ${var.ssh_key_path} ${var.ssh_user}@${aws_eip.app_eip.public_ip}"
  sensitive   = true
}
