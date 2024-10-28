output "s3_bucket_arn" {
  value = aws_s3_bucket.data.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.sns.arn
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.sqs.arn
}
