resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

  tags = {
    Name = "frontend-dev"
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
#      "ansible-pull -i localhost, -U https://github.com/Manju9876/roboshop-ansible-2025.git -e component_name=frontend -e env=dev roboshop.yaml",
    ]
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z03117651054LFO2TDC32"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}
