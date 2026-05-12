# ==========================================================
# FILE: terraform/variables.tf
# PURPOSE:
# Terraform Variables
# ==========================================================

variable "aws_region" {

  description = "AWS deployment region"

  type = string
}

variable "instance_type" {

  description = "EC2 instance type"

  type = string
}

variable "public_key" {

  description = "SSH public key for EC2 access"

  type = string
}