# ==========================================================
# FILE: terraform/main.tf
# PURPOSE:
# Dynamic Ephemeral Infrastructure Provisioning
# ----------------------------------------------------------
# This configuration:
# - Creates temporary AWS infrastructure
# - Supports full terraform destroy cleanup
# - Enables infrastructure recovery through CI/CD
# - Injects SSH public key dynamically
# - Creates EC2 instance for Docker deployment
# ==========================================================

# ==========================================================
# AWS PROVIDER
# ==========================================================

provider "aws" {
  region = var.aws_region
}

# ==========================================================
# RANDOM SUFFIX
# Prevents resource name collisions
# ==========================================================

resource "random_id" "suffix" {
  byte_length = 2
}

# ==========================================================
# UBUNTU AMI
# Fetch latest Ubuntu 22.04 image dynamically
# ==========================================================

data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"

    values = [
      "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# ==========================================================
# SSH KEY PAIR
# Public key injected into EC2
# ==========================================================

resource "aws_key_pair" "deployer" {

  key_name = "dynamic-key-${random_id.suffix.hex}"

  public_key = var.public_key
}

# ==========================================================
# SECURITY GROUP
# ==========================================================

resource "aws_security_group" "app_sg" {

  name = "dynamic-sg-${random_id.suffix.hex}"

  description = "Security group for dynamic recovery pipeline"

  # --------------------------------------------------------
  # SSH
  # --------------------------------------------------------

  ingress {

    description = "SSH"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # --------------------------------------------------------
  # APPLICATION PORT
  # --------------------------------------------------------

  ingress {

    description = "Application"

    from_port = 3000
    to_port   = 3000

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # --------------------------------------------------------
  # OUTBOUND TRAFFIC
  # --------------------------------------------------------

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dynamic-recovery-security-group"
  }
}

# ==========================================================
# EC2 INSTANCE
# ==========================================================

resource "aws_instance" "vm" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  # --------------------------------------------------------
  # USER DATA
  # Automatically installs Docker
  # --------------------------------------------------------

  user_data = <<-EOF
              #!/bin/bash

              apt update -y

              apt install -y docker.io

              systemctl enable docker
              systemctl start docker

              usermod -aG docker ubuntu

              EOF

  tags = {
    Name = "dynamic-recovery-instance"
  }
}