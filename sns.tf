resource "aws_sns_topic" "sns" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_policy" "sns_policy" {
  arn    = aws_sns_topic.sns.arn
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSEventsPermission",
      "Effect": "Allow",
      "Principal": {
        "Service": "events.amazonaws.com"
      },
      "Action": "sns:Publish",
      "Resource": "${aws_sns_topic.sns.arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_cloudwatch_event_rule.event-rule.arn}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  protocol  = "email"
  endpoint  = var.mail_dest
  topic_arn = aws_sns_topic.sns.arn
}