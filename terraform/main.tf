# ============================================================
# FILE: terraform/main.tf
# PURPOSE:
# Dynamic EC2 Infrastructure Provisioning
#
# FEATURES:
# - Dynamic public IP allocation
# - Docker auto-installation
# - Ephemeral infrastructure
# - Zero persistent AWS resource strategy
# ============================================================

# ============================================================
# AWS PROVIDER CONFIGURATION
# ============================================================

provider "aws" {
  region = var.aws_region
}
# ============================================================
# RANDOM RESOURCE SUFFIX
# ============================================================

resource "random_id" "suffix" {
  byte_length = 2
}
# ============================================================
# UBUNTU AMI LOOKUP
# ============================================================

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
# ============================================================
# EC2 SSH KEY PAIR
# ============================================================

resource "aws_key_pair" "deployer" {

  key_name = "enterprise-deployer-key-${random_id.suffix.hex}"

  public_key = var.public_key
}
# ============================================================
# APPLICATION SECURITY GROUP
# ============================================================

resource "aws_security_group" "app_sg" {

  name = "containerized-app-sg-${random_id.suffix.hex}"

  description = "Security group for dynamic recovery application"

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    description = "Application Access"

    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ============================================================
# EC2 APPLICATION SERVER
# ============================================================

resource "aws_instance" "app_server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [
    aws_security_group.app_sg.id
  ]

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y

              apt-get install -y \
                docker.io \
                docker-compose \
                git \
                curl

              systemctl enable docker
              systemctl start docker

              usermod -aG docker ubuntu
              EOF

  tags = {
    Name        = "containerized-app-server"
    Environment = "production"
    ManagedBy   = "terraform"
    Project     = "dynamic-recovery-app"
  }
}
# ============================================================
# ROUTE53 HOSTED ZONE LOOKUP
# ============================================================
data "aws_route53_zone" "main" {

  name = "auemeribetech.com.ng"

  private_zone = false
}
# ============================================================
# AUTOMATIC DNS RECOVERY RECORD
# ============================================================
resource "aws_route53_record" "app_dns" {

  zone_id = data.aws_route53_zone.main.zone_id

  name = "auemeribetech.com.ng"

  type = "A"

  ttl = 60

  records = [
    aws_instance.app_server.public_ip
  ]
}