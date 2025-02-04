output "platform_application_arn" {
  description = "ARN of the SNS platform application for FCM."
  value       = aws_sns_platform_application.fcm[0].arn
}

output "topic_arn" {
  description = "ARN of the SNS topic (if created)."
  value       = var.create_topic ? aws_sns_topic.this[0].arn : null
}

output "topic_policy_id" {
  description = "ID of the SNS topic policy (if created)."
  value       = (var.create_topic_policy && var.create_topic) ? aws_sns_topic_policy.this[0].id : null
}

output "sms_preferences" {
  description = "SMS preferences configuration (if set)."
  value       = var.create_sms_preferences ? aws_sns_sms_preferences.this[0] : null
}
