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
  }
  required_version = "~> 1.2"
}

provider "tfe" {
  # Configuration will be provided via environment variables:
  # TFE_TOKEN - HCP Terraform API token
  # TFE_HOSTNAME - defaults to app.terraform.io
  token = var.tfe_token
}