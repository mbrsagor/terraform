provider "aws" {
    region = "ca-central-1"
    access_key = "access_key"
    secret_key = "secret_key"
}

# Resource for AWS create new User (IAM)
resource "aws_iam_user" "user_example" {
    name = "example-user"
    path = "/system/"
    tags = {
        Environment = "Development"
        project = "MyDevelopmentProject"
    }
}
