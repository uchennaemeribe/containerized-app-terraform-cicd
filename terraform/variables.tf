# ==========================================================
# FILE: terraform/variables.tf
# PURPOSE: Variables ONLY
# ==========================================================

variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "public_key" {
  type = string
}