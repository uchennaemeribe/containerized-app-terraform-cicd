# ==========================================================
# FILE: terraform/outputs.tf
# PURPOSE:
# Terraform Outputs
# ==========================================================

output "public_ip" {

  description = "Dynamic public IP of EC2 instance"

  value = aws_instance.vm.public_ip
}