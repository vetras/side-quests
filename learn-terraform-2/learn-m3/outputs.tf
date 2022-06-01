##################################################################################
# OUTPUT
##################################################################################



##################################################################################
# https://stackoverflow.com/a/58203205/797369
#
# This will list the account terraform is using.
# It may help prevent stupid mistakes if the same computer managed multiple accounts.
# It has helped me before already !
#

data "aws_caller_identity" "current" {}

output "THE_ACCOUNT_USED" {
  value = data.aws_caller_identity.current
}

##################################################################################