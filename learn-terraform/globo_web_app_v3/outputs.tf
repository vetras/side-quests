output "main_url" {
  value = aws_lb.nginx.dns_name
}
output "nginx1_url" {
  value = aws_instance.nginx1.public_dns
}
output "nginx2_url" {
  value = aws_instance.nginx2.public_dns
}