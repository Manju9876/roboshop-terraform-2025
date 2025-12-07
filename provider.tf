provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://vault.devopsbymanju.shop:8200"
  token = var.vault_token
}