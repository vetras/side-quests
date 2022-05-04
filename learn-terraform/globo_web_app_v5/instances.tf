data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "nginx" {
  count                  = var.nbr_of_instances
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = module.s3.instance_profile.name
  depends_on             = [module.s3]

  # using mod we can distribute evenly the instances on the subnets
  subnet_id = module.vpc.public_subnets[(count.index % var.nbr_of_subnets)]

  user_data = templatefile("${path.module}/startup.tpl", {
    s3_bucket = module.s3.bucket_id
  })

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-nginx-${count.index + 1}"
  })
}
