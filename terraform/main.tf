# ==========================================================
# FILE: terraform/main.tf
# PURPOSE: AWS Infrastructure Provisioning
# ==========================================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

# ==========================================================
# PROVIDER CONFIGURATION
# ==========================================================

provider "aws" {
  region = var.aws_region
}

# ==========================================================
# VARIABLES
# ==========================================================

variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "public_key" {
  description = "SSH public key"
  type        = string
}

# ==========================================================
# RANDOM SUFFIX (PREVENT NAME COLLISIONS)
# ==========================================================

resource "random_id" "suffix" {
  byte_length = 2
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
  key_name   = "cicd-key-${random_id.suffix.hex}"
  public_key = var.public_key
}

# ==========================================================
# SECURITY GROUP
# ==========================================================

resource "aws_security_group" "app_sg" {
  name = "cicd-sg-${random_id.suffix.hex}"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Application Port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All Outbound"
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

# ==========================================================
# OUTPUTS
# ==========================================================

output "public_ip" {
  value = aws_instance.vm.public_ip
}