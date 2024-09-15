resource "random_uuid" "this" {}

resource "aws_s3_bucket" "this" {
  bucket = "spacelift-test-${random_uuid.this}"

  tags = {
    Name        = "spacelift-tes-deployment"
    Environment = "Dev"
  }
}