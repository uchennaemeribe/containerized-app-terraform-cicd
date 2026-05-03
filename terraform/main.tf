provider "aws" {
  region = var.region
}

# 🔍 Dynamically fetch latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# 🔐 Key Pair
resource "aws_key_pair" "key" {
  key_name   = "cicd-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# 🔥 Security Group
resource "aws_security_group" "sg" {
  name = "cicd-sg"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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

# 🚀 EC2 Instance
resource "aws_instance" "vm" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]

  # 🔥 Install Docker automatically
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install docker.io -y
              usermod -aG docker ubuntu
              systemctl start docker
              systemctl enable docker
              EOF

  tags = {
    Name = "cicd-vm"
  }
}