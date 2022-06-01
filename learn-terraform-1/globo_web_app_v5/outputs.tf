output "main_url" {
  value = aws_lb.nginx.dns_name
}