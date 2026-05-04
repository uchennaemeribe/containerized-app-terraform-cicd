# ==========================================
# FILE: terraform/main.tf
# PURPOSE: Provision AWS Infrastructure for CI/CD Pipeline
# ==========================================

# ==========================================
# PROVIDER CONFIGURATION
# ==========================================
provider "aws" {
  region = var.region
}

# ==========================================
# RANDOM SUFFIX (PREVENTS DUPLICATE ERRORS)
# ==========================================
resource "random_id" "suffix" {
  byte_length = 2
}

# ==========================================
# KEY PAIR (DYNAMIC NAME FROM CI/CD)
# ==========================================
resource "aws_key_pair" "key" {
  key_name   = "cicd-key-${random_id.suffix.hex}"
  public_key = var.public_key
}

# ==========================================
# SECURITY GROUP (ALLOW SSH + APP PORT)
# ==========================================
resource "aws_security_group" "sg" {
  name        = "cicd-sg-${random_id.suffix.hex}"
  description = "Allow SSH and HTTP (App)"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow App Port"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cicd-sg"
  }
}

# ==========================================
# EC2 INSTANCE (DYNAMICALLY PROVISIONED)
# ==========================================
resource "aws_instance" "vm" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "cicd-vm"
  }
}