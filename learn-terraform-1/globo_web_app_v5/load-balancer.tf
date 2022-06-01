# aws_lb
resource "aws_lb" "nginx" {
  name               = "${local.name_prefix}-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = module.vpc.public_subnets

  # this is a public LB
  internal = false

  # enable TF to delete this when we destroy the env
  enable_deletion_protection = false

  access_logs {
    bucket  = module.s3.bucket_name
    prefix  = local.alb_logs_folder
    enabled = true
  }

  tags = local.tags
}

# aws_lb_target_group
resource "aws_lb_target_group" "nginx" {
  name     = "${local.name_prefix}-nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
  tags     = local.tags
}

# aws_lb_listener
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }

  tags = merge(local.tags, {
    Name = "${local.name_prefix}-alb-listener"
  })
}

# aws_lb_target_group_attachements
resource "aws_lb_target_group_attachment" "alb_tg_attachments" {
  count            = var.nbr_of_instances
  target_id        = aws_instance.nginx[count.index].id
  target_group_arn = aws_lb_target_group.nginx.arn
  port             = 80
  # tags and name are not supported on this resource
}
