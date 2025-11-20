variable "ami_id" {
  description = "pre configrured template to launch ec2 instacne"
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  description = "ram setup"
  type = string
  default = "t3.micro"
}