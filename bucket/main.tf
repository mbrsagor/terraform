provider "aws" {
    region = "ca-central-1"
    access_key = "access_key"
    secret_key = "secret_key"
}


# Create new bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "developershaowm2038s"
  acl    = "private"
}
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
