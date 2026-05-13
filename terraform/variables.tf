# ============================================================
# FILE: terraform/variables.tf
# PURPOSE:
# Terraform Variable Definitions
# ============================================================

# ============================================================
# AWS REGION
# ============================================================

variable "aws_region" {

  description = "AWS deployment region"

  type = string

  default = "us-east-1"
}

# ============================================================
# EC2 INSTANCE TYPE
# ============================================================

variable "instance_type" {

  description = "EC2 instance type"

  type = string

  default = "t3.micro"
}

# ============================================================
# SSH PUBLIC KEY
# ============================================================

variable "public_key" {

  description = "SSH public key for EC2 authentication"

  type = string
}