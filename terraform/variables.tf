########################################
# 🌍 AWS REGION CONFIGURATION
########################################
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

########################################
# 🖥️ EC2 AMI CONFIGURATION
########################################
variable "ami" {
  description = "Ubuntu AMI ID"
}

########################################
# 🔐 SSH PUBLIC KEY (FROM GITHUB SECRET)
########################################
variable "public_key" {
  description = "SSH public key injected from GitHub Secrets"
  type        = string
}