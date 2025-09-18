provider "aws" {
    region = "ca-central-1"
    access_key = "access_key"
    secret_key = "secret_key"
}

#  Resource for creating EC2 instance
resource "aws_instance" "ec2_example" {
    # ami = "ami-86886"
    instance_type = var.instance_type
    instance_type = "t3.micro"
    count = var.instance_count
    tags = {
        Name = "Developer instance"
    }
}

# variable "instance_type" {
#     description = "Instance type t3 micro free trail"
#     type = string
#     default = "t3.micro"
# }

variable "instance_count" {
    description = "Instance instance count"
    type = number
    default = 2
}
