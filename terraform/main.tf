# ==========================================
# FILE: terraform/main.tf
# PURPOSE: Provision AWS infrastructure
# DESCRIPTION:
# - EC2 instance
# - Security group
# - SSH key injection
# - Docker auto-install
# ==========================================

# ==========================================================
# TERRAFORM CONFIGURATION
# ==========================================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ==========================================================
# AWS PROVIDER
# ==========================================================
provider "aws" {
  region = var.aws_region
}

# ==========================================================
# FETCH LATEST UBUNTU AMI (REGION-AWARE)
# ==========================================================
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ==========================================================
# SSH KEY PAIR
# ==========================================================
resource "aws_key_pair" "deployer" {
  key_name   = "cicd-key"
  public_key = var.public_key
}

# ==========================================================
# SECURITY GROUP
# ==========================================================
resource "aws_security_group" "app_sg" {
  name        = "cicd-sg"
  description = "Allow SSH and application traffic"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App Access (Port 3000)"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ==========================================================
# EC2 INSTANCE
# ==========================================================
resource "aws_instance" "vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # --------------------------------------------------------
  # USER DATA: INSTALL DOCKER
  # --------------------------------------------------------
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "cicd-instance"
  }
}