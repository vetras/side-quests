##################################################################################
# Required
##################################################################################

variable "private_subnets" {
  type = list(any)
}

variable "public_subnets" {
  type = list(any)
}

##################################################################################
# Optional
##################################################################################

variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "subnet_count" {
  type    = number
  default = 2
}

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

