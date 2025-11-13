# Create project for ephemeral workspace
resource "tfe_project" "ephemeral" {
  organization = var.organization_name
  name         = "ephemeral-workspaces"
  description  = "Project for managing ephemeral workspaces"
}
#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "ephemeral" {
  name                           = var.workspace_name
  organization                   = var.organization_name
  working_directory              = var.working_directory
  project_id                     = tfe_project.ephemeral.id
  queue_all_runs                 = false
  file_triggers_enabled          = false
  force_delete                   = false
  auto_destroy_activity_duration = "1h"
  vcs_repo {
    identifier         = var.github_repo
    oauth_token_id     = var.oauth_token_id
    branch             = "main"
    ingress_submodules = false
  }
}

# Workspace variables for AWS IAM role
#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_role_auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral.id
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_role_arn" {
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = aws_iam_role.ephemeral_workspace.arn
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral.id
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_region" {
  key          = "region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral.id
}