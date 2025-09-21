variable "aws_access_key" {
  description = "AWS access key for the ephemeral workspace"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key for the ephemeral workspace"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region for the ephemeral workspace"
  type        = string
  default     = "us-east-2"
}