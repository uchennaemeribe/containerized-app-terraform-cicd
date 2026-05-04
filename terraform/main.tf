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
# PROVIDER CONFIGURATION (REGION FROM VARIABLE)
# ==========================================================

provider "aws" {
  region = var.aws_region
}

# ==========================================================
# VARIABLES
# ==========================================================

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "public_key" {
  description = "SSH public key injected into EC2"
  type        = string
}

# ==========================================================
# FETCH LATEST UBUNTU AMI (REGION-AWARE, NO HARDCODING)
# ==========================================================

data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"] # Canonical (Ubuntu)

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
# SSH KEY PAIR (INJECTED FROM GITHUB SECRETS)
# ==========================================================

resource "aws_key_pair" "deployer" {
  key_name   = "cicd-key"
  public_key = var.public_key
}

# ==========================================================
# SECURITY GROUP (ALLOW SSH + APPLICATION TRAFFIC)
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
    description = "Application Access (Port 3000)"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All Outbound Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ==========================================================
# EC2 INSTANCE (APPLICATION HOST)
# ==========================================================

resource "aws_instance" "vm" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # --------------------------------------------------------
  # USER DATA: Install Docker Automatically
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