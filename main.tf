# SNS Platform Application
resource "aws_sns_platform_application" "fcm" {
  count               = var.create_platform_application ? 1 : 0
  name                = var.platform_application_name
  platform            = var.platform # Para FCM se utiliza "GCM"
  platform_credential = var.fcm_api_key

# Optional: event notification configuration (if provided)
  event_endpoint_created_topic_arn = var.event_endpoint_created_topic_arn
  event_endpoint_deleted_topic_arn = var.event_endpoint_deleted_topic_arn
  event_endpoint_updated_topic_arn = var.event_endpoint_updated_topic_arn
}

# SNS Topic (Optional)
resource "aws_sns_topic" "this" {
  count        = var.create_topic ? 1 : 0
  name         = var.topic_name
  display_name = var.topic_display_name
}

# SNS Topic Policy (Optional)
resource "aws_sns_topic_policy" "this" {
  count  = (var.create_topic_policy && var.create_topic) ? 1 : 0
  arn    = aws_sns_topic.this[0].arn
  policy = var.topic_policy
}

# SNS Topic Data Protection Policy (Optional)
resource "aws_sns_topic_data_protection_policy" "this" {
  count  = (var.create_topic_data_protection_policy && var.create_topic) ? 1 : 0
  arn    = aws_sns_topic.this[0].arn
  policy = var.topic_data_protection_policy
}

# SNS Topic Subscription (Optional)
resource "aws_sns_topic_subscription" "this" {
  count     = (var.create_topic_subscription && var.create_topic) ? 1 : 0
  topic_arn = aws_sns_topic.this[0].arn
  protocol  = var.subscription_protocol
  endpoint  = var.subscription_endpoint
}

# SNS SMS Preferences (Optional, at the account level)
resource "aws_sns_sms_preferences" "this" {
  count               = var.create_sms_preferences ? 1 : 0
  default_sender_id   = var.sms_default_sender_id
  default_sms_type    = var.sms_default_sms_type
  monthly_spend_limit = var.sms_monthly_spend_limit
}
