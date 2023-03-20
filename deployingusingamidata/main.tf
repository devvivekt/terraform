terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
    region     = "ap-southeast-1"
}


data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "app_server_dev" {
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

