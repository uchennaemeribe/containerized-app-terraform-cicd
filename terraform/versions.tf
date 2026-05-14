# ============================================================
# FILE: terraform/versions.tf
# PURPOSE:
# Terraform Version + Provider Management
# ============================================================

terraform {

  required_version = ">= 1.5.0"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
# ==========================================================
# REMOTE TERRAFORM STATE
# ==========================================================

  backend "s3" {

    bucket         = "dynamic-recovery-terraform-state"

    key            = "global/terraform.tfstate"

    region         = "us-east-1"

    dynamodb_table = "terraform-locks"

    encrypt        = true
  }
}