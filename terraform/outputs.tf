# ==========================================================
# FILE: terraform/outputs.tf
# PURPOSE: Outputs ONLY
# ==========================================================
output "instance_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  value = aws_instance.app_server.public_dns
}