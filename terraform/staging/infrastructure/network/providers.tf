provider "aws" {
  region  = var.region
  profile = var.profile
  version = "~> 2.25"
}

terraform {
  required_version = ">= 0.12.0"

  backend "s3" {
    bucket         = "terraform-estado-remoto"
    key            = "staging/infrastructure/network/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-trava-estado"
  }
}

module "network" {
  source = "../../../modules/infrastructure/network"

  billing        = "infrastructure"
  environment    = "staging"
  application    = "infrastructure"
  vpc-name       = "vpc-dimarino-stg"
  vpc-cidr-block = "172.18.0.0/16"

  public-subnet-cidr-blocks = ["172.18.0.0/20",
    "172.18.32.0/20",
    "172.18.64.0/20",
    "172.18.96.0/20",
    "172.18.128.0/20",
  "172.18.160.0/20"]

  private-subnet-cidr-blocks = ["172.18.16.0/20",
    "172.18.48.0/20",
    "172.18.80.0/20",
    "172.18.112.0/20",
    "172.18.144.0/20",
  "172.18.176.0/20"]

  availability-zones = ["us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e",
  "us-east-1f"]
}
