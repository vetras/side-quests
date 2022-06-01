# We need to get the LB principal to allow on the policy
data "aws_elb_service_account" "root" {}

module "s3" {
  source      = "./modules/globo-s3"
  bucket_name = local.s3_bucket_name
  elb_arn     = data.aws_elb_service_account.root.arn
  common_tags = local.tags
}

# aws_s3_object
#    Uploading two files to the bucket, this time with FOR EACH
resource "aws_s3_object" "website_content" {
  for_each = {
    website = "/website/index.html"
    logo    = "/website/Globo_logo_Vert.png"
  }

  bucket = module.s3.bucket_name
  # key is the destination inside the bucket
  key    = each.value
  source = ".${each.value}"
  etag   = filemd5(".${each.value}")
  tags   = local.tags
}
