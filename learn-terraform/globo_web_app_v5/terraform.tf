#
# Global terraform settings
# 
# Used to configure general settings of the terraform configuration
#     AND
# Provider Information like AWS version, using more than one provider (e.g.: aws ireland region and aws US region)
#
# Examples of general TF settings:
#  - TF version
#  - plugins
#  - settings for state data
#  - experimental language features
#

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  # access_key // secret_key loaded from ENV VARS
  region = var.aws_region
  endpoints {
    sts = "https://sts.eu-west-1.amazonaws.com"
  }
}
