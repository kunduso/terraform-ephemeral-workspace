variable "organization_name" {
  description = "HCP Terraform organization name"
  type        = string
  default     = "wellsiau-org"
}

variable "workspace_name" {
  description = "Name for the ephemeral workspace"
  type        = string
  default     = "ws-application-01"
}

variable "auto_destroy_duration" {
  description = "Duration after which the workspace will be auto-destroyed (e.g., '1h', '30m')"
  type        = string
  default     = "1h"
}

variable "github_repo" {
  description = "GitHub repository for VCS integration"
  type        = string
  default     = "kunduso/terraform-ephemeral-workspace"
}

variable "working_directory" {
  description = "Working directory in the repository"
  type        = string
  default     = "02-infrastructure"
}

variable "oauth_token_id" {
  description = "OAuth token ID for GitHub VCS integration"
  type        = string
  default     = null
}

variable "project_id" {
  description = "HCP Terraform project ID"
  type        = string
  default     = "prj-dtD69e5CJERnbuxz"
}

variable "tfe_token" {
  type    = string
  default = null
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-west-2"
}

variable "aws_access_key_id" {
  description = "AWS access key ID from GitHub Actions"
  type        = string
  default     = null
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS secret access key from GitHub Actions"
  type        = string
  default     = null
  sensitive   = true
}

variable "aws_session_token" {
  description = "AWS session token from GitHub Actions"
  type        = string
  default     = null
  sensitive   = true
}