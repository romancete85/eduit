# Configure the AWS Provider
provider "aws" {
  region     = region_aws
  access_key = ""
  secret_key = ""
}

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

resource "aws_instance" "web" {
  ami           = ami-0b0dcb5067f052a63
  //ami = "" // NO ES ELEGANTE!
  instance_type = "t2.micro"
  key_name = "terratest"

  tags = {
    Name = "web-server"
  }
}

output "public_ip" {
  value       = aws_instance.web.public_ip
}