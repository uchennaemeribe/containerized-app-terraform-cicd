# ==========================================================
# FILE: terraform/main.tf
# PURPOSE:
# Dynamic EC2 Infrastructure Provisioning
#
# FEATURES:
# - Dynamic public IP allocation
# - Docker auto-installation
# - Ephemeral infrastructure
# - Zero persistent AWS resource strategy
# ==========================================================

# ==========================================================
# AWS PROVIDER
# ==========================================================

provider "aws" {
  region = var.aws_region
}

# ==========================================================
# RANDOM RESOURCE SUFFIX
# ==========================================================

resource "random_id" "suffix" {
  byte_length = 2
}

# ==========================================================
# UBUNTU AMI
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

  key_name = "dynamic-recovery-key-${random_id.suffix.hex}"

  public_key = var.public_key
}

# ==========================================================
# SECURITY GROUP
# ==========================================================

resource "aws_security_group" "app_sg" {

  name = "dynamic-recovery-sg-${random_id.suffix.hex}"

  description = "Managed by Terraform"

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "Application Port"

    from_port = 3000

    to_port = 3000

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0

    to_port = 0

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

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              apt update -y

              apt install docker.io -y

              systemctl start docker

              systemctl enable docker

              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "dynamic-recovery-instance"
  }
}