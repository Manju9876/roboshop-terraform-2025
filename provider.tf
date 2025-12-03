provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://3.81.29.104:8200"
  token = var.vault_token
}