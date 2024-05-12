#Creacion del security group
resource "aws_security_group" "Web_sg" {
  name = "webhttp_sg"
  description = "Allow HTTP and SSH inbound traffic"

  ingress = {
      description      = "HTTP from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  egress = {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "ec2_web_terra" {
    ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name = "terra_key"
  vpc_security_group_ids = [aws_security_group.Web_sg.id]
  tags = {
    Name = "ec2_web_terra"
  }

  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  EOF
  
}