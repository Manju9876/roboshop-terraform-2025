tag_name = {
  # mongodb = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  catalogue = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.small"
  }

  # frontend = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #   ansible_role  = "frontend-docker"
  #  }
  cart = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.small"

   # ansible_role  = "cart-docker"
   }
  # mysql = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # shipping = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #   ansible_role  = "shipping-docker"
  # }
  # redis = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # payment = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #   ansible_role  = "payment-docker"
  # }
  # user = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #   ansible_role  = "user-docker"
  # }
  # rabbitmq = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # dispatch = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #   ansible_role  = "dispatch-docker"
  # }
}

zone_id = "Z0739029GOTW9PY9KD3W"

vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

env = "dev"

