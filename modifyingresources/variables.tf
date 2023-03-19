variable "ec2_instance_type" {
    default = "t2.micr"
}

variable "ec2_ami_us_east_1" {
    default = "ami-02f3f602d23f1659d"
}

variable "elb_name" {
    type = string
    default = "myfirst-elb"
}

variable "az" {
    type = list
    default = ["us-east-1", "us-east-", "us-east"]
}

variable "timeout" {
    type = number
    default = 100
}
