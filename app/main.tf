provider "aws" {
    region = "us-east-1"
    access_key = "access_key"
    secret_key = "secret_key"
}

#  Resource
resource "aws_instance" "ec2_example" {
    ami = "ami-id"
    instance_type = "t2.micro"
    tags = {
        Name = "EC2 Example machine"
    }
}
