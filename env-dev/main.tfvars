tag_name = {
  mongodb = {
    ami_id        = "ami-0220d79f3f480ecf5"
    instance_type = "t3.small"
  }
  catalogue = {
    ami_id                = "ami-0220d79f3f480ecf5"
    instance_type         = "t3.small"
    docker_component_name = "catalogue-docker"
  }
  frontend = {
    ami_id                = "ami-0220d79f3f480ecf5"
    instance_type         = "t3.small"
    docker_component_name = "frontend-docker"
  }

  # cart = {
  #   ami_id                = "ami-09c813fb71547fc4f"
  #   instance_type         = "t3.small"
  #   docker_component_name = "catalogue-docker"
  # }
  # mysql = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # shipping = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #    docker_component_name = "shipping-docker"
  # }
  # redis = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # payment = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  #    docker_component_name = "payment-docker"
  # }
  # user = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # docker_component_name = "user-docker"
  # }
  # rabbitmq = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # }
  # dispatch = {
  #   ami_id        = "ami-09c813fb71547fc4f"
  #   instance_type = "t3.small"
  # docker_component_name = "dispatch-docker"
  # }
}

zone_id = "Z0739029GOTW9PY9KD3W"

vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

env = "dev"

#private_key_pem = "/home/ec2-user/roboshop-key.pem"