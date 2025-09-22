# Test if workspace can be read
data "tfe_workspace" "test" {
  name         = "hallaway-track-hashiconf-2025"
  organization = "wellsiau-org"
}

#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
resource "tfe_workspace" "ephemeral" {
  name                  = var.workspace_name
  organization          = var.organization_name
  project_id            = var.project_id
  working_directory     = var.working_directory
  queue_all_runs        = false
  file_triggers_enabled = false
  force_delete          = false
  vcs_repo {
    identifier                 = var.github_repo
    ingress_submodules         = false
    github_app_installation_id = var.github_app_installation_id
  }
}

# Workspace variables for AWS IAM role
#https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
resource "tfe_variable" "aws_role_auth" {
  key          = "TFC_AWS_PROVIDER_AUTH"
  value        = "true"
  category     = "terraform"
  workspace_id = data.tfe_workspace.test.id
}

# #https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
# resource "tfe_variable" "aws_role_arn" {
#   key          = "TFC_AWS_RUN_ROLE_ARN"
#   value        = var.aws_role_arn
#   category     = "terraform"
#   workspace_id = "ws-waoXRA9tKaxETDTe"
# }

# #https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
# resource "tfe_variable" "aws_region" {
#   key          = "region"
#   value        = var.aws_region
#   category     = "terraform"
#   workspace_id = "ws-waoXRA9tKaxETDTe"
# }