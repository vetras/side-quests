locals {
  tags = {
    managed_by_terraform = true
    environment          = var.environment_name
    project              = "globo-${var.project}"
    billing_code         = var.billing_code
  }
}