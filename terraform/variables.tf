# ==========================================
# FILE: terraform/variables.tf
# PURPOSE: Centralized input variables
# DESCRIPTION:
# - Defines all configurable inputs
# - Prevents duplication across files
# ==========================================

# ==========================================================
# AWS REGION
# ==========================================================
variable "aws_region" {
  description = "AWS region where infrastructure will be deployed"
  type        = string
}

# ==========================================================
# SSH PUBLIC KEY (FROM GITHUB SECRETS)
# ==========================================================
variable "public_key" {
  description = "SSH public key injected into EC2"
  type        = string
}

# ==========================================================
# EC2 INSTANCE TYPE (PARAMETERIZED)
# ==========================================================
variable "instance_type" {
  description = "EC2 instance type (e.g., t3.micro)"
  type        = string
  default     = "t3.micro"
}