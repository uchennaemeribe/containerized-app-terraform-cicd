########################################
# ☁️ AWS PROVIDER CONFIGURATION
########################################
provider "aws" {
  region = var.region
}

########################################
# 🔐 SSH KEY PAIR CREATION
########################################
resource "aws_key_pair" "key" {
  key_name   = "cicd-key"
  public_key = var.public_key
}

########################################
# 🔒 SECURITY GROUP CONFIGURATION
########################################
resource "aws_security_group" "sg" {
  name = "cicd-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

########################################
# 🖥️ EC2 INSTANCE CREATION
########################################
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