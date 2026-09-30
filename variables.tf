variable "project_name" {
  description = "Project name used for tags and resource names."
  type        = string
  default     = "terraform-cloud-observability-lab"
}

variable "environment" {
  description = "Environment label."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "admin_cidr" {
  description = "Optional CIDR allowed to SSH to the instance. Leave empty to disable SSH ingress."
  type        = string
  default     = ""
}
