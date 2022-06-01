##################################################################################
# AWS Provider
#

#
# Note that TF credentials are now loaded from these ENV vars, because we use the:
#    terraform { required_providers { aws = { ... } } }
# 
# export AWS_ACCESS_KEY_ID=...
# export AWS_SECRET_ACCESS_KEY=...

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
# Variables Per Environment

variable "vpc_cidr_block" {
  type        = map(string)
  description = "Base CIDR Block for VPC"
}

variable "nbr_of_subnets" {
  type        = map(number)
  description = "Number of subnets to create in VPC"
}

variable "nbr_of_instances" {
  type        = map(number)
  description = "How many EC2 to create. They are distributed evenly across available subnets."
}

variable "instances_type" {
  type        = map(string)
  description = "The type of instance to create."
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

variable "name_prefix" {
  type        = string
  description = "Naming preffix for all resources."
  default     = "gl"
}
