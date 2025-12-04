provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://35.175.121.38:8200"
  token = var.vault_token
}