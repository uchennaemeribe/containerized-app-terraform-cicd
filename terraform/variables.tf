########################################
# 🌍 AWS REGION CONFIGURATION
########################################
variable "region" {
  description = "AWS region for resource deployment"
  default     = "us-east-1"
}

########################################
# 🖥️ EC2 AMI CONFIGURATION
########################################
variable "ami" {
  description = "Ubuntu AMI ID used for EC2 instance"
  default     = "ami-0c02fb55956c7d316"
}

########################################
# 🔐 SSH PUBLIC KEY (CI/CD INJECTED)
########################################
variable "public_key" {
  description = "SSH public key injected from GitHub Secrets for EC2 access"
  type        = string
}