# ==========================================================
# FILE: terraform/outputs.tf
# PURPOSE: Outputs ONLY
# ==========================================================

output "public_ip" {
  value = aws_instance.vm.public_ip
}