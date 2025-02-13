# Variables for Platform Application (FCM)

variable "create_platform_application" {
  description = "Determines if the Platform Application for FCM should be created."
  type        = bool
  default     = true
}

variable "platform_application_name" {
  description = "Name for the SNS application (Platform Application)."
  type        = string
}

variable "platform" {
  description = "Platform for the application; use 'GCM' for FCM."
  type        = string
  default     = "GCM"
}

variable "fcm_credentials_json" {
  description = "JSON file content with FCM connection secrets; used instead of fcm_api_key if provided."
  type        = string
  default     = ""
  sensitive   = true

  validation {
    condition     = can(jsondecode(var.fcm_credentials_json))
    error_message = "The Firebase JSON is invalid"
}
}

# Variables for event notifications (optional)

variable "event_endpoint_created_topic_arn" {
  description = "ARN of the SNS Topic for endpoint creation notifications (optional)."
  type        = string
  default     = ""
}

variable "event_endpoint_deleted_topic_arn" {
  description = "ARN of the SNS Topic for endpoint deletion notifications (optional)."
  type        = string
  default     = ""
}

variable "event_endpoint_updated_topic_arn" {
  description = "ARN of the SNS Topic for endpoint update notifications (optional)."
  type        = string
  default     = ""
}

# Variables for SNS Topic (Optional)

variable "create_topic" {
  description = "Determines if an additional SNS Topic should be created."
  type        = bool
  default     = false
}

variable "topic_name" {
  description = "Name of the SNS Topic."
  type        = string
  default     = ""
}

variable "topic_display_name" {
  description = "Display name of the SNS Topic."
  type        = string
  default     = ""
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage (0-100) of successful HTTP/HTTPS deliveries to log."
  type        = number
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "IAM role ARN for HTTP/HTTPS success feedback logging."
  type        = string
  default     = ""
}

variable "http_failure_feedback_role_arn" {
  description = "IAM role ARN for HTTP/HTTPS failure feedback logging."
  type        = string
  default     = ""
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage (0-100) of successful Lambda deliveries to log."
  type        = number
  default     = null
}

variable "lambda_success_feedback_role_arn" {
  description = "IAM role ARN for Lambda success feedback logging."
  type        = string
  default     = ""
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role ARN for Lambda failure feedback logging."
  type        = string
  default     = ""
}

# Variables for SNS Topic Policy (Optional)

variable "create_topic_policy" {
  description = "Determines if a policy for the SNS Topic should be created."
  type        = bool
  default     = false
}

variable "topic_policy" {
  description = "Policy in JSON format for the SNS Topic."
  type        = string
  default     = ""
}

# Variables for SNS Topic Data Protection Policy (Optional)

variable "create_topic_data_protection_policy" {
  description = "Determines if a data protection policy for the SNS Topic should be created."
  type        = bool
  default     = false
}

variable "topic_data_protection_policy" {
  description = "Data protection policy in JSON format for the SNS Topic."
  type        = string
  default     = ""
}

# Variables for SNS Topic Subscription (Optional)

variable "create_topic_subscription" {
  description = "Determines if a subscription to the SNS Topic should be created."
  type        = bool
  default     = false
}

variable "subscription_protocol" {
  description = "Protocol for the SNS Topic subscription (e.g., email, https, lambda)."
  type        = string
  default     = ""
}

variable "subscription_endpoint" {
  description = "Endpoint for the SNS Topic subscription (email, URL, Lambda ARN, etc.)."
  type        = string
  default     = ""
}

# Variables for SNS SMS Preferences (Optional)

variable "create_sms_preferences" {
  description = "Determines if SMS preferences are configured at the account level."
  type        = bool
  default     = false
}

variable "sms_default_sender_id" {
  description = "Default sender ID for SMS."
  type        = string
  default     = ""
}

variable "sms_default_sms_type" {
  description = "Default SMS type; can be 'Promotional' or 'Transactional'."
  type        = string
  default     = ""
}

variable "sms_monthly_spend_limit" {
  description = "Monthly spending limit for SMS (in USD, as a string)."
  type        = string
  default     = ""
}

# Additional attributes (Optional)

variable "tags" {
  description = "Map of tags for resources."
  type        = map(string)
  default     = {}
}

variable "additional_platform_attributes" {
  description = "Map of additional attributes for the platform application (e.g., for delivery status tracking or other special parameters)."
  type        = map(string)
  default     = {}
}

variable "enable_delivery_status_logging" {
  description = "Enables the creation of the IAM role for SNS feedback logging."
  type        = bool
  default     = false
}