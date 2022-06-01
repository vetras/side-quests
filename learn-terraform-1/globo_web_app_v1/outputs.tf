output "aws_instance_dns" {
  value = aws_instance.nginx1.public_dns
}
