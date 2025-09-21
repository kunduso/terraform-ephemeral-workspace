variable "aws_role_arn" {
  description = "AWS IAM role ARN for the ephemeral workspace"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the ephemeral workspace"
  type        = string
  default     = "us-west-2"
}