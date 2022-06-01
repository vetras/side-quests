locals {
  tags = {
    managed_by_terraform = true
    project              = "globo-${var.project}"
    billing_code         = var.billing_code
    environment          = terraform.workspace
  }
  alb_logs_folder = "alb-logs"
  name_prefix     = "${var.name_prefix}-${terraform.workspace}"
  s3_bucket_name  = lower("${local.name_prefix}-s3-bucket-${random_integer.rand.result}")
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}