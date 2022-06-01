output "bucket_name" {
  value = aws_s3_bucket.b.bucket
}
output "bucket_id" {
  value = aws_s3_bucket.b.id
}
output "instance_profile" {
  value =aws_iam_instance_profile.nginx_profile
}
