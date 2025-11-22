variable "ami_id" {
  description = "pre configrured template to launch ec2 instacne"
  type = string
  default = "ami-09c813fb71547fc4f"
}
variable "instance_name" {
  default = [
  "frontend",
  "mongodb",
  "catalogue"
  ]
}
variable "instance_type" {
  description = "ram setup"
  type = string
  default = "t3.micro"
}

variable "vpc_security_group-ids" {
  description = "Allow all security group"
  type = list(string)
  default = ["sg-043ff9d2da877c20a"]
}

variable "zone_id" {
  description = "hosted zone of domain"
  type = string
  default = "Z03117651054LFO2TDC32"
}

variable "env" {
  description = "environment type"
  type = string
  default = "dev"
}