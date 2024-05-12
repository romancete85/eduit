output "Instance_id" {
  description = "ID de instacia EC2"
  value = aws_instance.web.id
}
output "Intance_public_ip" {
  description = "Ip publica de instancia EC2"
  value = aws_instance.web.public_ip
}