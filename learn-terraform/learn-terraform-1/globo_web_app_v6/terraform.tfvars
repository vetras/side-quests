billing_code = "pluralsight-terraform-1"
project      = "web-app"

vpc_cidr_block = {
  dev = "10.0.0.0/16"
  uat = "10.1.0.0/16"
  prd = "10.2.0.0/16"
}

nbr_of_subnets = {
  dev = "2"
  uat = "2"
  prd = "3"
}

nbr_of_instances = {
  dev = "2"
  uat = "4"
  prd = "6"
}

instances_type = {
  dev = "t2.nano"
  uat = "t2.nano"
  prd = "t2.micro"
}
