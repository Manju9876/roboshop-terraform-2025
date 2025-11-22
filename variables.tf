variable "instance_name" {
  default = {
    mongodb = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"
    }
    catalogue = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"
    }
    frontend = {
      ami_id = "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"
    }
  }
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