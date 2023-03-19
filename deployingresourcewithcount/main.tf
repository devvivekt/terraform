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


resource "aws_instance" "app_server" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t2.micro"
  count = 3
  tags = {
    Name = var.instancetagname_list[count.index]
  }
}