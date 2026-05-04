# ==========================================
# FILE: terraform/outputs.tf
# PURPOSE: Export EC2 Public IP for CI/CD Pipeline
# DESCRIPTION:
# This output is consumed by GitHub Actions to dynamically
# retrieve the EC2 public IP after Terraform provisioning.
# ==========================================

output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.vm.public_ip
}