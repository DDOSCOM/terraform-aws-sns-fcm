locals {
  # Selects the credential value:
  # Uses the JSON file content if provided; otherwise, uses the API key.
  platform_credential = var.fcm_credentials_json != "" ? var.fcm_credentials_json : var.fcm_api_key

  # Base map with the FCM credential.
  base_attributes = {
    PlatformCredential = local.platform_credential
  }

  # Adds event notification attributes if defined.
  event_attributes = merge(
    var.event_endpoint_created_topic_arn != "" ? { EventEndpointCreated = var.event_endpoint_created_topic_arn } : {},
    var.event_endpoint_deleted_topic_arn != "" ? { EventEndpointDeleted = var.event_endpoint_deleted_topic_arn } : {},
    var.event_endpoint_updated_topic_arn != "" ? { EventEndpointUpdated = var.event_endpoint_updated_topic_arn } : {}
  )

  # Merges all attributes: base, events, and any additional attributes.
  platform_application_attributes = merge(
    local.base_attributes,
    local.event_attributes,
    var.additional_platform_attributes
  )
}
