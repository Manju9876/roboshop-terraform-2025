resource "aws_instance" "web" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-043ff9d2da877c20a"]

  tags = {
    Name = "frontend"
  }
}