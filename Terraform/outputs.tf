output "instance_ip" {
  description = "ip of created instance"
  value       = module.my_ec2.instance_ip2
}

output "instance_id" {
  description = "id of created instance"
  value       = module.my_ec2.instance_id2
}