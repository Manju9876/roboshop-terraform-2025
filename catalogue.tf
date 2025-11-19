resource "aws_instance" "catalogue" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

  tags = {
    Name = "catalogue-dev"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z03117651054LFO2TDC32"
  name    = "catalogue-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "null_resource" "catalogue" {
  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.public_ip
    }
    inline = [
      "sudo python3.11 -m pip install ansible",
      "ansible-pull -i localhost, -U https://github.com/Manju9876/roboshop-ansible-2025.git -e component_name=catalogue -e env=dev roboshop.yaml"
    ]
  }
}
