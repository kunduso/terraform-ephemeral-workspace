terraform {
  cloud {
    organization = "wellsiau-org"
    workspaces {
      name = "kunduso-hashitalk25"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.82.2"
    }
  }
  required_version = "~> 1.2"
}
provider "aws" {
  region     = var.region
  default_tags {
    tags = {
      Source = "https://github.com/kunduso/hashitalk-2025-ephemeral-workpsace"
    }
  }
}
