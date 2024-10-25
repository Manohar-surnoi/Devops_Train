output "instance_ip2" {
  description = "ip of created instance"
  value       = aws_instance.second_demo_server.public_ip
}

output "instance_id2" {
  description = "id of created instance"
  value       = aws_instance.second_demo_server.id
}