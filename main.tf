module "ec2" {
  for_each = var.tag_name
  source   = "./modules/ec2"

  ami_id                 = each.value["ami_id"]
  instance_type          = each.value["instance_type"]
  env                    = var.env
  vpc_security_group_ids = var.vpc_security_group_ids
  zone_id = var.zone_id

  tag_name = each.key
}



#resource "aws_instance" "instances" {
#   count = length(var.instance_name)
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   vpc_security_group_ids = var.vpc_security_group_ids
#
#   tags = {
#     Name = var.instance_name[count.index]
#   }
# }

#
# resource "aws_route53_record" "catalogue" {
#   zone_id = "Z03117651054LFO2TDC32"
#   name    = "catalogue-dev"
#   type    = "A"
#   ttl     = 30
#   records = [aws_instance.catalogue.private_ip]
# }
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