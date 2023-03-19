terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {}

variable "instancetagname_list" {
    type = list
    default = ["myfirstec2instance","mysecondec2instance","mythirdec2instance"]
}

variable "istest" {
  default = false
}


resource "aws_instance" "app_server_dev" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"
  count = var.istest == true ? 2 : 0
  tags = {
    Name = var.instancetagname_list[count.index]
  }
}

resource "aws_instance" "app_server_prod" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"
  count = var.istest == false ? 3 : 0
  tags = {
    Name = var.instancetagname_list[count.index]
  }
}