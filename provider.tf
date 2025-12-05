provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://100.28.226.211:8200"
  token = var.vault_token
}