output "workspace_url" {
  description = "URL to access the ephemeral workspace"
  value       = "https://app.terraform.io/app/wellsiau-org/workspaces/${tfe_workspace.ephemeral.name}"
}