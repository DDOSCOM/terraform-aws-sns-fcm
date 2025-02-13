locals {
  fcm_secrets = jsondecode(var.fcm_credentials_json)

  # AWS SNS expects the complete JSON, not just the private_key
  platform_credential = jsonencode({
    type                        = local.fcm_secrets["type"]
    project_id                  = local.fcm_secrets["project_id"]
    private_key_id              = local.fcm_secrets["private_key_id"]
    private_key                 = local.fcm_secrets["private_key"]
    client_email                = local.fcm_secrets["client_email"]
    client_id                   = local.fcm_secrets["client_id"]
    auth_uri                    = local.fcm_secrets["auth_uri"]
    token_uri                   = local.fcm_secrets["token_uri"]
    auth_provider_x509_cert_url = local.fcm_secrets["auth_provider_x509_cert_url"]
    client_x509_cert_url        = local.fcm_secrets["client_x509_cert_url"]
  })

  # Base map with FCM credentials
  base_attributes = {
    PlatformCredential = local.platform_credential
  }

  # Add event attributes if defined
  event_attributes = merge(
    var.event_endpoint_created_topic_arn != "" ? { EventEndpointCreated = var.event_endpoint_created_topic_arn } : {},
    var.event_endpoint_deleted_topic_arn != "" ? { EventEndpointDeleted = var.event_endpoint_deleted_topic_arn } : {},
    var.event_endpoint_updated_topic_arn != "" ? { EventEndpointUpdated = var.event_endpoint_updated_topic_arn } : {}
  )

  # Mix all attributes
  platform_application_attributes = merge(
    local.base_attributes,
    local.event_attributes,
    var.additional_platform_attributes
  )
}

data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
