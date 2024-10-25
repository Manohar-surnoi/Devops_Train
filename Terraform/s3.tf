resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "my-tf-test-bucket32"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}