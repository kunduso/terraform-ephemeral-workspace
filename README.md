[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-white.svg)](https://choosealicense.com/licenses/unlicense/) [![GitHub pull-requests closed](https://img.shields.io/github/issues-pr-closed/kunduso/terraform-ephemeral-workspace)](https://github.com/kunduso/terraform-ephemeral-workspace/pulls?q=is%3Apr+is%3Aclosed) [![GitHub pull-requests](https://img.shields.io/github/issues-pr/kunduso/terraform-ephemeral-workspace)](https://GitHub.com/kunduso/terraform-ephemeral-workspace/pull/) 
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/kunduso/terraform-ephemeral-workspace)](https://github.com/kunduso/terraform-ephemeral-workspace/issues?q=is%3Aissue+is%3Aclosed) [![GitHub issues](https://img.shields.io/github/issues/kunduso/terraform-ephemeral-workspace)](https://GitHub.com/kunduso/terraform-ephemeral-workspace/issues/) 
[![terraform-infra-provisioning](https://github.com/kunduso/terraform-ephemeral-workspace/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/kunduso/terraform-ephemeral-workspace/actions/workflows/terraform.yml) 
# Automate HCP Terraform Ephemeral Workspaces with TFE Provider
![Image](https://skdevops.files.wordpress.com/2025/02/111-image-0.png)
## Introduction
This repository demonstrates how to programmatically create and manage ephemeral workspaces in HashiCorp Cloud Platform (HCP) Terraform using the TFE provider. It provides a complete infrastructure-as-code approach for automating ephemeral workspace lifecycle management with GitHub Actions integration.

Ephemeral workspaces are temporary HCP Terraform workspaces that automatically destroy their resources after a specified duration or at a scheduled time. This makes them ideal for proof-of-concepts, testing environments, and short-lived infrastructure deployments where automatic cleanup prevents resource sprawl and cost accumulation.

## Repository Structure
This repository is organized into two main components:

- **`01-workspace-management/`** - Contains TFE provider configuration to programmatically create ephemeral workspaces, including AWS OIDC setup, project creation, and workspace configuration with auto-destroy settings.
- **`02-infrastructure/`** - Contains AWS infrastructure code (VPC, subnets, gateways) that demonstrates how to use the ephemeral workspace to deploy actual cloud resources that will be automatically cleaned up.
## Prerequisites
Before you begin, ensure you have the following:

- **HCP Terraform Account**: An active [HCP Terraform account](https://app.terraform.io/session) with Plus or Enterprise plan (ephemeral workspaces require paid plans)
- **AWS Account**: An active [AWS account](https://console.aws.amazon.com/console/home#) with permissions to create IAM roles and policies
- **GitHub Repository**: A GitHub repository with Actions enabled for CI/CD automation
- **Required Secrets**: Configure the following GitHub Actions secrets:
  - `TF_API_TOKEN` - HCP Terraform API token for workspace management
  - `OAUTH_TOKEN_ID` - GitHub VCS integration token from HCP Terraform
  - `IAM_ROLE` - AWS IAM role ARN for GitHub Actions OIDC authentication
- **Knowledge**: Basic understanding of Terraform, AWS, and GitHub Actions

## Getting Started

### Quick Start
1. **Fork this repository** to your GitHub account
2. **Configure GitHub Actions secrets** as listed in prerequisites
3. **Update variables** in `01-workspace-management/variables.tf` with your organization and repository details
4. **Push changes** to trigger the automated workflow

### Detailed Setup
For comprehensive setup instructions, follow these blog posts in order:

1. **[Provision AWS Resources with GitHub and HCP Terraform](http://skundunotes.com/2025/01/03/provision-aws-resources-with-github-and-hcp-terraform/)** - Learn HCP Terraform fundamentals and GitHub VCS integration
2. **[Getting Started with Ephemeral Workspaces in HCP Terraform](https://skundunotes.com/2025/02/20/getting-started-with-ephemeral-workspaces-in-hcp-terraform/)** - Understand manual ephemeral workspace configuration
3. **[Automate HCP Terraform Ephemeral Workspaces with TFE Provider](#)** - Complete automation guide using this repository

## How It Works

### Part 1: Workspace Creation (`01-workspace-management/`)
The GitHub Actions workflow automatically:
- Creates AWS OIDC provider and IAM role for secure authentication
- Creates HCP Terraform project and ephemeral workspace using TFE provider
- Configures workspace with VCS integration and auto-destroy settings
- Sets up workspace variables for AWS authentication

### Part 2: Infrastructure Deployment (`02-infrastructure/`)
The ephemeral workspace:
- Monitors the repository for changes to infrastructure code
- Automatically provisions AWS resources (VPC, subnets, gateways) when changes are merged
- Destroys all resources after 1 hour of inactivity (configurable)
- Provides automatic cleanup without manual intervention

## Key Features
- **Infrastructure as Code**: Complete automation using TFE provider
- **OIDC Authentication**: Secure AWS access without long-lived credentials
- **Auto-Destroy**: Automatic resource cleanup after specified duration
- **GitHub Integration**: VCS-driven workflows with Actions automation
- **Cost Control**: Prevents resource sprawl through automatic cleanup

## Troubleshooting
Common issues and solutions:

1. **TFE Provider Authentication**: Ensure `TF_API_TOKEN` is valid and has proper permissions
2. **AWS OIDC Setup**: Verify IAM role trust policy allows GitHub Actions OIDC
3. **VCS Integration**: Check `OAUTH_TOKEN_ID` matches your GitHub VCS provider in HCP Terraform
4. **Organization Plan**: Ephemeral workspaces require HCP Terraform Plus or Enterprise plan
5. **Workspace Creation**: Verify organization name and project settings in variables

For additional help:
- [HCP Terraform Documentation](https://developer.hashicorp.com/terraform/cloud-docs)
- [TFE Provider Documentation](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs)
- [AWS OIDC with GitHub Actions](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)

## Contributing
If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request. Contributions are always welcome!
## License
This code is released under the Unlicense License. See [LICENSE](LICENSE).