terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "Kube-nodes" {
  count = length(var.tagName)
  ami           = "ami-0be5e7c36e4d8ec10"
  instance_type = "t2.large"
  security_groups = ["K8-Master-SG","launch-wizard-9"]
  key_name = "march"

  tags = {
    Name = var.tagName[count.index]
  }
}