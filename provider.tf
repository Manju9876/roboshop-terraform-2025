provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://44.222.105.0:8200"
  token = var.vault_token
}