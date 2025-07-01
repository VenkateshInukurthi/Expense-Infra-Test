provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name_prefix = "web-sg"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2_1" {
  source            = "./modules/ec2_with_dns"
  ami               = "ami-0abcdef1234567890"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-xxxxxxxx"
  security_group_id = aws_security_group.web_sg.id
  zone_id           = "Z123456ABCDEFG"
  record_name       = "web1.example.com"
  name              = "web1"
}

module "ec2_2" {
  source            = "./modules/ec2_with_dns"
  ami               = "ami-0abcdef1234567890"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-xxxxxxxx"
  security_group_id = aws_security_group.web_sg.id
  zone_id           = "Z123456ABCDEFG"
  record_name       = "web2.example.com"
  name              = "web2"
}

module "ec2_3" {
  source            = "./modules/ec2_with_dns"
  ami               = "ami-0abcdef1234567890"
  instance_type     = "t2.micro"
  subnet_id         = "subnet-xxxxxxxx"
  security_group_id = aws_security_group.web_sg.id
  zone_id           = "Z123456ABCDEFG"
  record_name       = "web3.example.com"
  name              = "web3"
}