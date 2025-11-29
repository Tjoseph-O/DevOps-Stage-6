
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "todo-microservices"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
  default     = "ubuntu"
}

variable "ssh_key_path" {
  description = "Path to SSH private key"
  type        = string
}

variable "domain_name" {
  description = "Domain name for the application"
  type        = string
}

variable "allowed_ssh_ips" {
  description = "IPs allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
