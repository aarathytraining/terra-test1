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

resource "aws_instance" "Kube-Master-t" {
  ami           = "ami-0be5e7c36e4d8ec10"
  instance_type = "t2.large"
  security_groups = ["Kubemaster1"]
  key_name = "march"

  tags = {
    Name = "Kube-Master-t1"
  }
}

resource "aws_instance" "Kube-Worker-t" {
  ami           = "ami-0be5e7c36e4d8ec10"
  instance_type = "t2.large"
  security_groups = ["Kubeworker1"]
  key_name = "march"

  tags = {
    Name = "Kube-Worker-t1"
  }
}
