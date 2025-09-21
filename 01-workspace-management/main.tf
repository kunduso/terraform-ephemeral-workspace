resource "tfe_workspace" "ephemeral_demo" {
  name              = var.workspace_name
  organization      = var.organization_name
  auto_apply        = true
  queue_all_runs    = false
  working_directory = var.working_directory

  # Enable ephemeral workspace with auto-destroy
  auto_destroy_activity_duration = var.auto_destroy_duration

  vcs_repo {
    identifier     = var.github_repo
    branch         = "main"
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }

  tag_names = [
    "ephemeral",
    "demo",
    "hashiconf-2025"
  ]
}

# Get OAuth client for GitHub integration
data "tfe_oauth_client" "github" {
  organization = var.organization_name
  name         = "GitHub"
}

# Workspace variables for AWS credentials
resource "tfe_variable" "aws_access_key" {
  key          = "access_key"
  value        = var.aws_access_key
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_secret_key" {
  key          = "secret_key"
  value        = var.aws_secret_key
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral_demo.id
  sensitive    = true
}

resource "tfe_variable" "aws_region" {
  key          = "region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral_demo.id
}