terraform {
  cloud {
    organization = "wellsiau-org"

    workspaces {
      name = "workspace-manager"
    }
  }

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.69.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.0"
    }
  }
  required_version = "~> 1.2"
}

provider "tfe" {
  # Configuration will be provided via environment variables:
  # TFE_TOKEN - HCP Terraform API token
  # TFE_HOSTNAME - defaults to app.terraform.io
  token = var.tfe_token
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Source = "https://github.com/kunduso/terraform-ephemeral-workspace/01-workspace-management"
    }
  }
}