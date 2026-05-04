# ==========================================================
# FILE: terraform/variables.tf
# PURPOSE: Variable Definitions
# ==========================================================

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}