output "main_url" {
  value = aws_lb.nginx.dns_name
}

##################################################################################
# https://stackoverflow.com/a/58203205/797369
#
# This will list the account terraform is using.
# It may help prevent stupid mistakes if the same computer managed multiple accounts.
# It has helped me before already !
#

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}

##################################################################################