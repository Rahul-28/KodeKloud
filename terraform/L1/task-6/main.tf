resource "aws_instance" "web_server" {
  ami           = "ami-0b029b1931b347543"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerInstance"
  }
}

resource "aws_eip" "datacenter-eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc"
  tags = {
    name = "datacenter-eip"
  }
}

output "eip-public-ip" {
  value = aws_eip.datacenter-eip.public_ip
}
