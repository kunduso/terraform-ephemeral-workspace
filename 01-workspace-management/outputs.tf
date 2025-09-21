output "workspace_id" {
  description = "ID of the created ephemeral workspace"
  value       = tfe_workspace.ephemeral_demo.id
}

output "workspace_name" {
  description = "Name of the created ephemeral workspace"
  value       = tfe_workspace.ephemeral_demo.name
}

output "workspace_url" {
  description = "URL to access the ephemeral workspace"
  value       = "https://app.terraform.io/app/${var.organization_name}/workspaces/${tfe_workspace.ephemeral_demo.name}"
}

output "auto_destroy_duration" {
  description = "Auto-destroy duration for the workspace"
  value       = tfe_workspace.ephemeral_demo.auto_destroy_duration
}

output "workspace_lifecycle" {
  description = "Workspace lifecycle information"
  value = {
    created_at            = tfe_workspace.ephemeral_demo.created_at
    auto_destroy_duration = tfe_workspace.ephemeral_demo.auto_destroy_duration
    tags                  = tfe_workspace.ephemeral_demo.tag_names
  }
}