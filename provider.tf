provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://3.239.5.196:8200"
  token = var.vault_token
}