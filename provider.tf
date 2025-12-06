provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://13.221.206.120:8200"
  token = var.vault_token
}