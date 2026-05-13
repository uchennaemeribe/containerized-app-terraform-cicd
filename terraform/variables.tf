# ==========================================================
# FILE: terraform/variables.tf
# PURPOSE:
# Terraform Variables
# ==========================================================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}