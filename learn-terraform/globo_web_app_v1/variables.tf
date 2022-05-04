variable "aws_access_key" {
  type        = string
  description = "AWS access key"
  sensitive   = true
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "AWS region :: defaults to Ireland (eu-west-1)"
  sensitive   = false
  default     = "eu-west-1"
}

# Billing Variables

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = ""
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}