provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://18.207.238.2:8200"
  token = var.vault_token
}