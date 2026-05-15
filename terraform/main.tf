# ============================================================
# FILE: terraform/main.tf
# PURPOSE:
# Enterprise Stable Infrastructure Provisioning
#
# FEATURES:
# - Stable EC2 infrastructure
# - Docker auto-installation
# - Nginx reverse proxy
# - HTTPS-ready architecture
# - Persistent production infrastructure
# - Route53 automatic DNS management
# ============================================================

# ============================================================
# AWS PROVIDER CONFIGURATION
# ============================================================

provider "aws" {
  region = var.aws_region
}

# ============================================================
# EC2 SSH KEY PAIR
# ============================================================

resource "aws_key_pair" "deployer" {

  key_name = "enterprise-deployer-key"

  public_key = var.public_key
}

# ============================================================
# APPLICATION SECURITY GROUP
# ============================================================

resource "aws_security_group" "app_sg" {

  name = "enterprise-app-security-group"

  description = "Enterprise production security group"

  # ==========================================================
  # SSH ACCESS
  # ==========================================================

  ingress {

    description = "SSH Access"

    from_port = 22
    to_port   = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # ==========================================================
  # HTTP ACCESS
  # ==========================================================

  ingress {

    description = "HTTP Access"

    from_port = 80
    to_port   = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # ==========================================================
  # HTTPS ACCESS
  # ==========================================================

  ingress {

    description = "HTTPS Access"

    from_port = 443
    to_port   = 443

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # ==========================================================
  # OUTBOUND ACCESS
  # ==========================================================

  egress {

    from_port = 0
    to_port   = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "enterprise-production-security-group"
  }
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

  # ==========================================================
  # SERVER INITIALIZATION
  # ==========================================================

  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y

              apt-get install -y \
                docker.io \
                nginx \
                certbot \
                python3-certbot-nginx \
                git \
                curl

              systemctl enable docker
              systemctl start docker

              systemctl enable nginx
              systemctl start nginx

              usermod -aG docker ubuntu
              EOF

  tags = {
    Name        = "enterprise-production-server"
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
# AUTOMATIC DNS RECORD
# ============================================================

resource "aws_route53_record" "app_dns" {

  zone_id = data.aws_route53_zone.main.zone_id

  name = "auemeribetech.com.ng"

  type = "A"

  ttl = 300

  records = [
    aws_instance.app_server.public_ip
  ]
}