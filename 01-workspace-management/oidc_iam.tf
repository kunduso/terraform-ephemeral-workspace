#Create OIDC provider and IAM role for HCP Terraform to assume via OIDC

# #Obtain TLS certificate thumbprint for app.terraform.io
# data "tls_certificate" "hcp_terraform" {
#   url = "https:#app.terraform.io"
# }

data "aws_iam_openid_connect_provider" "hcp_terraform" {
  url = "https://app.terraform.io"

  # client_id_list = [
  #   "aws.workload.identity",
  # ]

  # thumbprint_list = [
  #   data.tls_certificate.hcp_terraform.certificates[0].sha1_fingerprint,
  # ]
}

# Build the assume role policy scoped to this organization and workspace.
# We scope project to "*" to avoid requiring a project name variable; the
# subject will still restrict to the configured workspace name.
data "aws_iam_policy_document" "ephemeral_oidc_assume_role_policy" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.hcp_terraform.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "app.terraform.io:aud"
      values   = ["aws.workload.identity"]
    }

    condition {
      test     = "StringLike"
      variable = "app.terraform.io:sub"
      values   = ["organization:${var.organization_name}:project:*:workspace:${var.workspace_name}:run_phase:*"]
    }
  }
}

resource "aws_iam_role" "ephemeral_workspace" {
  name               = replace("ephemeral-${var.workspace_name}", "/[^A-Za-z0-9+=,.@_-]/", "-")
  assume_role_policy = data.aws_iam_policy_document.ephemeral_oidc_assume_role_policy.json
}

# Attach AdministratorAccess for POC convenience. This can be tightened later.
resource "aws_iam_role_policy_attachment" "admin_attach" {
  role       = aws_iam_role.ephemeral_workspace.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

output "ephemeral_role_arn" {
  value       = aws_iam_role.ephemeral_workspace.arn
  description = "ARN of the IAM role created for the ephemeral workspace"
}
