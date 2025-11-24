# variable "ami_id" {}
# variable "instance_type" {}
variable "vpc_security_group_ids" {}
variable "tag_name" {}
variable "env" {}
variable "zone_id" {}




# variable "ami_id" {
#   description = "pre configrured template to launch ec2 instacne"
#   type = string
#   default = "ami-09c813fb71547fc4f"
# }
# variable "instance_name" {
#   default = [
#   "frontend",
#   "mongodb",
#   "catalogue"
#   ]
# }
# variable "instance_type" {
#   description = "ram setup"
#   type = string
#   default = "t3.micro"
# }
#
# variable "vpc_security_group_ids" {
#   description = "Allow all security group"
#   type = list(string)
#   default = ["sg-043ff9d2da877c20a"]
# }