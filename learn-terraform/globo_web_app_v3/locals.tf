locals {
  tags = {
    managed_by_terraform = true
    environment          = var.environment_name
    project              = "globo-${var.project}"
    billing_code         = var.billing_code
  }
  s3_bucket_name  = "glovo-web-app-${random_integer.rand.result}"
  alb_logs_folder = "alb-logs"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}