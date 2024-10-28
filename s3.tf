resource "aws_s3_bucket" "data" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_notification" "notif" {
  bucket = aws_s3_bucket.data.id
  eventbridge = true
}