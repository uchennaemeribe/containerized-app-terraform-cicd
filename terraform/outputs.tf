# ==========================================================
# FILE: terraform/outputs.tf
# PURPOSE:
# Export Dynamic Infrastructure Values
# ==========================================================

output "public_ip" {

  description = "Dynamic EC2 Public IP"

  value = aws_instance.vm.public_ip
}