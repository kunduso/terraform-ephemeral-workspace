#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "ephemeral" {
  name              = var.workspace_name
  # organization      = var.organization_name
  # project_id        = var.project_id
  # auto_apply        = true
  # queue_all_runs    = false
  # working_directory = var.working_directory


  # # Enable ephemeral workspace with auto-destroy
  # auto_destroy_activity_duration = var.auto_destroy_duration

  # vcs_repo {
  #   identifier     = var.github_repo
  #   branch         = "main"
  #   oauth_token_id = var.oauth_token_id
  # }

  # tag_names = [
  #   "ephemeral",
  #   "demo",
  #   "hashiconf-2025"
  # ]
}

# Workspace variables for AWS IAM role
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
resource "tfe_variable" "aws_region" {
  key          = "region"
  value        = var.aws_region
  category     = "terraform"
  workspace_id = tfe_workspace.ephemeral.id
}