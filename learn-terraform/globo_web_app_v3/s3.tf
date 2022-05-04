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
#    Uploading two files to the bucket
#    Using ETAGs the files will re-upload only when changed
resource "aws_s3_object" "html" {
  bucket = aws_s3_bucket.b.bucket

  # destination inside the bucket
  key = "website/index.html"

  source = "./website/index.html"
  etag   = filemd5("./website/index.html")
  tags   = local.tags
}
resource "aws_s3_object" "logo" {
  bucket = local.s3_bucket_name
  key    = "website/Globo_logo_Vert.png"
  source = "./website/Globo_logo_Vert.png"
  etag   = filemd5("./website/Globo_logo_Vert.png")
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
