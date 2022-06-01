##################################################################################
# DATA
##################################################################################

data "aws_availability_zones" "available" {
  state = "available"
}

##################################################################################
# NETWORKING
##################################################################################

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-internet-gateway"
  })
}

resource "aws_subnet" "subnets" {
  count                   = var.nbr_of_subnets
  cidr_block              = cidrsubnet("10.0.0.0/16", 8, count.index)
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-subnet-${count.index + 1}"
  })
}

# ROUTING #
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.tags, {
    Name = "${local.name_prefix}-route-table"
  })
}

resource "aws_route_table_association" "rta-subnets" {
  count          = var.nbr_of_subnets
  subnet_id      = aws_subnet.subnets[count.index].id
  route_table_id = aws_route_table.rtb.id
  # tags and name are not supported on this resource
}

# SECURITY GROUPS #

resource "aws_security_group" "nginx_sg" {
  name   = "${local.name_prefix}-nginx-sg"
  vpc_id = aws_vpc.vpc.id
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
  vpc_id = aws_vpc.vpc.id
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
