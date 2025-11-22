resource "aws_instance" "instances" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group-ids

  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name    = "${var.name}-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances.private_ip]
}