output "public_ips" {
  value = aws_instance.shivi[*].public_ip
}
