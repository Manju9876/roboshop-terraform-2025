module "ec2" {
  for_each = var.instance_name
  source = "./modules/ec2"

  ami_id = each.value["ami_id"]
  env    = var.env
  instance_type = each.value["instance_type"]
  name = each.key
  vpc_security_group-ids = var.vpc_security_group-ids
  zone_id = var.zone_id
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