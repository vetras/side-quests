output "main_url" {
  value = aws_lb.nginx.dns_name
}
output "nginx_urls" {
  value = aws_instance.nginx[*].public_dns
}