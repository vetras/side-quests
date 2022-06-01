##################################################################################
# Environment
#

#
# Note that TF credentials are now loaded from these ENV vars, because we use the:
#    terraform { required_providers { aws = { ... } } }
# 
# export AWS_ACCESS_KEY_ID=...
# export AWS_SECRET_ACCESS_KEY=...

# TODO: is this a good practice ?
variable "environment_name" {
  type        = string
  description = "The environment name will be set on the TAGs of all entities managed by TF"
  default     = "dev"
}

##################################################################################
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

##################################################################################
# Constants
# variables with defults set that we do not need to provide
# this allows us not to replicate constants on code and improve re-usability
#

variable "aws_region" {
  type        = string
  description = "AWS region :: defaults to Ireland (eu-west-1)"
  sensitive   = false
  default     = "eu-west-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}
