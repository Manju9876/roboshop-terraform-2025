resource "aws_instance" "mongodb" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

  tags = {
    Name = "mongodb-dev"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z03117651054LFO2TDC32"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}
