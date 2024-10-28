variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "bucket-upload-events-test"
}

variable "sns_topic_name" {
  description = "Name of the SNS topic"
  default     = "sns-topic-event-test"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  default     = "sqs-queue-event-test"
}

variable "event_bus_name" {
  description = "Name of the EventBridge bus"
  default     = "event-bus-event-test"
}

variable "mail_dest" {
  description = "Mail adresse to receive SNS notification"
}