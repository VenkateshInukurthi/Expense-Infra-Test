resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]
  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "dns" {
  zone_id = var.zone_id
  name    = var.record_name
  type    = "A"
  ttl     = 300
  records = [aws_instance.this.public_ip]
}