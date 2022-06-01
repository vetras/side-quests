# We need to get the LB principal to allow on the policy
data "aws_elb_service_account" "root" {}

# aws_s3_bucket
resource "aws_s3_bucket" "b" {
  bucket = local.s3_bucket_name

  # to allow TF to destroy this
  force_destroy = true

  tags = local.tags
}

# aws_s3_bucket_acl
resource "aws_s3_bucket_acl" "b-acl" {
  bucket = aws_s3_bucket.b.id

  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl
  # Owner gets FULL_CONTROL. No one else has access rights.
  acl = "private"
}

# aws_s3_bucket_policy
resource "aws_s3_bucket_policy" "b-policy" {
  bucket = aws_s3_bucket.b.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${data.aws_elb_service_account.root.arn}"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${local.s3_bucket_name}/${local.alb_logs_folder}/*"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "delivery.logs.amazonaws.com"
      },
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${local.s3_bucket_name}/${local.alb_logs_folder}/*",
      "Condition": {
        "StringEquals": {
          "s3:x-amz-acl": "bucket-owner-full-control"
        }
      }
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "delivery.logs.amazonaws.com"
      },
      "Action": "s3:GetBucketAcl",
      "Resource": "arn:aws:s3:::${local.s3_bucket_name}"
    }
  ]
}
POLICY
}

# aws_s3_object
#    Uploading two files to the bucket, this time with FOR EACH
resource "aws_s3_object" "website_content" {
  for_each = {
    website = "/website/index.html"
    logo    = "/website/Globo_logo_Vert.png"
  }

  bucket = aws_s3_bucket.b.bucket
  # key is the destination inside the bucket
  key    = each.value
  source = ".${each.value}"
  etag   = filemd5(".${each.value}")
  tags   = local.tags
}

# aws_iam_role
resource "aws_iam_role" "allow_nginx_s3" {
  name = "allow_nginx_s3"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = local.tags
}

# aws_iam_role_policy
resource "aws_iam_role_policy" "allow_s3_all" {
  name = "allow_s3_all"
  role = aws_iam_role.allow_nginx_s3.name

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
                "arn:aws:s3:::${local.s3_bucket_name}",
                "arn:aws:s3:::${local.s3_bucket_name}/*"
            ]
    }
  ]
}
EOF

}

# aws_iam_role_instance_profile
resource "aws_iam_instance_profile" "nginx_profile" {
  name = "nginx_profile"
  role = aws_iam_role.allow_nginx_s3.name

  tags = local.tags
}
