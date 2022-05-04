data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "nginx" {
  count                  = var.nbr_of_instances
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.nginx_profile.name
  depends_on             = [aws_iam_role_policy.allow_s3_all]

  # using mod we can distribute evenly the instances on the subnets
  subnet_id = aws_subnet.subnets[(count.index % var.nbr_of_subnets)].id

  user_data = templatefile("${path.module}/startup.tpl", {
    s3_bucket = aws_s3_bucket.b.id
  })

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-nginx-${count.index + 1}"
  })
}
