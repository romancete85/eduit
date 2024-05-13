data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


# Declara la VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Terraform_vpc"
  }
}
  # Declara una subred dentro de la VPC
resource "aws_subnet" "zona_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "SubredZonaA"
  }
}
# Declara una puerta de enlace de internet para la VPC
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Declara una ruta para el tráfico saliente hacia el internet
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.main.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}


#grupo de seguridad

resource "aws_security_group" "WEBTERRA" {
    name = "server-ec2-sg"
    description = "Allow traffic http & ssh"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "Access http"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Access ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
  
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "PKUBUNTU"
  vpc_security_group_ids = [aws_security_group.WEBTERRA.id]
  subnet_id = aws_subnet.zona_a.id
  associate_public_ip_address = true
  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt install nginx -y
EOF
  tags = {
    Name = "Web-server"
  }
}
