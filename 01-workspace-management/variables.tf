variable "organization_name" {
  description = "HCP Terraform organization name"
  type        = string
  default     = "wellysiau-org"
}

variable "workspace_name" {
  description = "Name for the ephemeral workspace"
  type        = string
  default     = "hallaway-track-hashiconf-2025"
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
}

