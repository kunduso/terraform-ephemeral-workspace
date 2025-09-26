

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "ephemeral" {
  name                           = var.workspace_name
  organization                   = var.organization_name
  project_id                     = var.project_id
  queue_all_runs                 = false
  file_triggers_enabled          = true
  force_delete                   = false
  auto_destroy_activity_duration = "1h"
  auto_apply                     = true
  speculative_enabled            = true
  vcs_repo {
    identifier         = var.github_repo
    oauth_token_id     = var.oauth_token_id
    ingress_submodules = false
  }
}

# Workspace environment variables for AWS IAM role
#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_role_auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "env"
  workspace_id = tfe_workspace.ephemeral.id
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_role_arn" {
  key          = "TFC_AWS_RUN_ROLE_ARN"
  value        = var.aws_role_arn
  category     = "env"
  workspace_id = tfe_workspace.ephemeral.id
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_workload_identity_audience" {
  key          = "TFC_AWS_WORKLOAD_IDENTITY_AUDIENCE"
  value        = "aws.workload.identity"
  category     = "env"
  workspace_id = tfe_workspace.ephemeral.id
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_region" {
  key          = "region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral.id
}