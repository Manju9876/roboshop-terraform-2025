resource "aws_instance" "mongodb" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group-ids

  tags = {
    Name = "mongodb-dev"
  }

  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    inline = [
      "sudo python3.11 -m pip install ansible",
      "ansible-pull -i localhost, -U https://github.com/Manju9876/roboshop-ansible-2025.git -e component_name=frontend -e env=dev roboshop.yaml"
    ]
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z03117651054LFO2TDC32"
  name    = "mongodb-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}
