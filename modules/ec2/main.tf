
resource "aws_instance" "instances" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.tag_name
  }
}

resource "aws_route53_record" "records" {
  zone_id = var.zone_id
  name    = "${var.tag_name}-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances.private_ip]
}

resource "null_resource" "ansible_code" {
  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.instances.private_ip
    }

    inline = [
      "sudo python3.11 -m pip install ansible",
      "ansible-pull -i localhostm -U https://github.com/Manju9876/roboshop-ansible-2025 roboshop.yaml -e component_name=${var.tag_name} -e enc=${var.env}"
    ]
  }
}