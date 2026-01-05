resource "aws_instance" "instances" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
#  key_name               = var.key_name

  # instance_market_options {
  #   market_type = "spot"
  #
  #   spot_options {
  #     instance_interruption_behavior = "stop"
  #     spot_instance_type = "persistent"
  #
  #   }
  # }

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
  depends_on = [aws_route53_record.records]

  triggers = {
    instance_id_change = aws_instance.instances.id
  }
  provisioner "remote-exec" {

    connection {
#      type     = "ssh"
      user     = data.vault_generic_secret.sample.data["username"]
#      private_key = file(var.private_key_pem)
      password = data.vault_generic_secret.sample.data["password"]
      host     = aws_instance.instances.private_ip
    }

    inline = [
      "sudo python3.11 -m pip install ansible hvac",
      " sudo ansible-pull -i localhost, -U https://github.com/Manju9876/roboshop-ansible-2025 roboshop.yaml -e component_name=${var.tag_name} -e env=${var.env} -e vault_token=${var.vault_token}"
    ]
  }
}

#
# resource "aws_instance" "instances" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = var.vpc_security_group_ids
#   key_name      = var.key_name
#
#   user_data = <<EOF
# #!/bin/bash
# dnf install -y python3.11
# pip3 install ansible hvac
# ansible-pull -U https://github.com/Manju9876/roboshop-ansible-2025 roboshop.yaml \
#   -e component_name=${var.tag_name} \
#   -e env=${var.env} \
#   -e vault_token=${var.vault_token}
# EOF
# }
#
