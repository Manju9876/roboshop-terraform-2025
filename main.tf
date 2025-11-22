resource "aws_instance" "instances" {
  for_each = var.instance_name
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group-ids

  tags = {
    Name = each.key
  }
}


resource "aws_route53_record" "record" {
  for_each = var.instance_name
  zone_id = var.zone_id
  name    = "${each.key}-${var.env}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instances[each.key].private_ip]
}
#
# resource "null_resource" "catalogue" {
#   provisioner "remote-exec" {
#
#     connection {
#       type = "ssh"
#       user = "ec2-user"
#       password = "DevOps321"
#       host = self.public_ip
#     }
#     inline = [
#       "sudo python3.11 -m pip install ansible",
#       "ansible-pull -i localhost, -U https://github.com/Manju9876/roboshop-ansible-2025.git -e component_name=frontend -e env=dev roboshop.yaml",
#     ]
#   }
# }