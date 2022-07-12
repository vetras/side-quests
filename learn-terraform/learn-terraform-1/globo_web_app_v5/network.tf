##################################################################################
# DATA
##################################################################################

data "aws_availability_zones" "available" {
  state = "available"
}

##################################################################################
# NETWORKING
##################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "=3.10.0"

  cidr           = var.vpc_cidr_block
  azs            = slice(data.aws_availability_zones.available.names, 0, var.nbr_of_subnets)
  public_subnets = [for i in range(var.nbr_of_subnets) : cidrsubnet(var.vpc_cidr_block, 8, i)]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

# SECURITY GROUPS #

resource "aws_security_group" "nginx_sg" {
  name   = "${local.name_prefix}-nginx-sg"
  vpc_id = module.vpc.vpc_id
  tags   = local.tags

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  # outbound internet access everywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb_sg" {
  name   = "${local.name_prefix}-nginx-alb-sg"
  vpc_id = module.vpc.vpc_id
  tags   = local.tags

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access everywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
