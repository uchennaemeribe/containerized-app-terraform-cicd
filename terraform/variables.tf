variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami" {
  description = "Ubuntu AMI ID"
}

variable "public_key_path" {
  description = "Path to SSH public key"
}
