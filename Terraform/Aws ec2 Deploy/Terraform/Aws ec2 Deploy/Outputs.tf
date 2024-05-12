output "Instance_id" {
  description = "ID de instacia EC2"
  value       = ec2_web_terra.web.id
}
output "Intance_public_ip" {
  description = "Ip publica de instancia EC2"
  value       = ec2_web_terra.web.public_ip
}