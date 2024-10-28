resource "aws_cloudwatch_event_rule" "event-rule" {
  description   = "Object create events on bucket s3"
  event_pattern = <<EOF
{
  "detail-type": [
    "Object Created"
  ],
  "source": [
    "aws.s3"
  ],
  "detail": {
    "requester": "${data.aws_caller_identity.current.account_id}"
    "bucket": {
      "name": ["${aws_s3_bucket.data.id}"]
    }
  }
}
EOF
}

resource "aws_cloudwatch_event_target" "sns_target" {
  rule = aws_cloudwatch_event_rule.event-rule.name
  arn  = aws_sns_topic.sns.arn
  input_path = "$.detail"
}

resource "aws_cloudwatch_event_target" "sqs_target" {
  rule = aws_cloudwatch_event_rule.event-rule.name
  arn  = aws_sqs_queue.sqs.arn
  input_path = "$.detail"
}

