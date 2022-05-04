locals {
  tags = {
    managed_by_terraform = true
    project              = "globo-${var.project}"
    billing_code         = var.billing_code
  }
}