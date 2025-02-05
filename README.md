## Terraform AWS SNS FCM Module
This repository contains a Terraform module that provisions an AWS SNS Platform Application specifically configured for Firebase Cloud Messaging (FCM). The module leverages AWS SNS's support for Google Cloud Messaging (GCM) to enable push notifications via FCM.

## Features
SNS Platform Application for FCM:
Creates an SNS Platform Application using the required platform_application_name, platform (set to "GCM" for FCM), and platform_credential (the FCM API key).
- Optional Event Notifications:
Supports configuration of event notification topics using the following optional parameters:
- event_endpoint_created_topic_arn
- event_endpoint_deleted_topic_arn
- event_endpoint_updated_topic_arn

## Optional SNS Topic Creation:
Allows you to create an SNS Topic with customizable topic_name and topic_display_name.
- Optional SNS Topic Policy and Data Protection Policy:
You can attach a fully formed JSON policy to the SNS Topic and define a data protection policy if needed.
- Optional SNS Topic Subscription:
Supports subscribing an endpoint (such as an email, HTTP endpoint, or Lambda function) to the SNS Topic with configurable protocol and endpoint.
- Optional SMS Preferences:
Enables the configuration of SMS preferences at the account level (e.g., setting the default sender ID, SMS type, and monthly spend limit).

## Usage
Configure the module by passing in the required variables (such as your FCM API key) along with any optional parameters. The module is designed to be integrated into a larger infrastructure-as-code setup and can be deployed using tools like Terragrunt for multi-environment management.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sns_platform_application.fcm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_platform_application) | resource |
| [aws_sns_sms_preferences.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_sms_preferences) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_data_protection_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_data_protection_policy) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_platform_attributes"></a> [additional\_platform\_attributes](#input\_additional\_platform\_attributes) | Map of additional attributes for the platform application (e.g., for delivery status tracking or other special parameters). | `map(string)` | `{}` | no |
| <a name="input_create_platform_application"></a> [create\_platform\_application](#input\_create\_platform\_application) | Determines if the Platform Application for FCM should be created. | `bool` | `true` | no |
| <a name="input_create_sms_preferences"></a> [create\_sms\_preferences](#input\_create\_sms\_preferences) | Determines if SMS preferences are configured at the account level. | `bool` | `false` | no |
| <a name="input_create_topic"></a> [create\_topic](#input\_create\_topic) | Determines if an additional SNS Topic should be created. | `bool` | `false` | no |
| <a name="input_create_topic_data_protection_policy"></a> [create\_topic\_data\_protection\_policy](#input\_create\_topic\_data\_protection\_policy) | Determines if a data protection policy for the SNS Topic should be created. | `bool` | `false` | no |
| <a name="input_create_topic_policy"></a> [create\_topic\_policy](#input\_create\_topic\_policy) | Determines if a policy for the SNS Topic should be created. | `bool` | `false` | no |
| <a name="input_create_topic_subscription"></a> [create\_topic\_subscription](#input\_create\_topic\_subscription) | Determines if a subscription to the SNS Topic should be created. | `bool` | `false` | no |
| <a name="input_event_endpoint_created_topic_arn"></a> [event\_endpoint\_created\_topic\_arn](#input\_event\_endpoint\_created\_topic\_arn) | ARN of the SNS Topic for endpoint creation notifications (optional). | `string` | `""` | no |
| <a name="input_event_endpoint_deleted_topic_arn"></a> [event\_endpoint\_deleted\_topic\_arn](#input\_event\_endpoint\_deleted\_topic\_arn) | ARN of the SNS Topic for endpoint deletion notifications (optional). | `string` | `""` | no |
| <a name="input_event_endpoint_updated_topic_arn"></a> [event\_endpoint\_updated\_topic\_arn](#input\_event\_endpoint\_updated\_topic\_arn) | ARN of the SNS Topic for endpoint update notifications (optional). | `string` | `""` | no |
| <a name="input_fcm_api_key"></a> [fcm\_api\_key](#input\_fcm\_api\_key) | API Key for Firebase Cloud Messaging (FCM). | `string` | `""` | no |
| <a name="input_fcm_credentials_json"></a> [fcm\_credentials\_json](#input\_fcm\_credentials\_json) | JSON file content with FCM connection secrets; used instead of fcm\_api\_key if provided. | `string` | `""` | no |
| <a name="input_http_failure_feedback_role_arn"></a> [http\_failure\_feedback\_role\_arn](#input\_http\_failure\_feedback\_role\_arn) | IAM role ARN for HTTP/HTTPS failure feedback logging. | `string` | `""` | no |
| <a name="input_http_success_feedback_role_arn"></a> [http\_success\_feedback\_role\_arn](#input\_http\_success\_feedback\_role\_arn) | IAM role ARN for HTTP/HTTPS success feedback logging. | `string` | `""` | no |
| <a name="input_http_success_feedback_sample_rate"></a> [http\_success\_feedback\_sample\_rate](#input\_http\_success\_feedback\_sample\_rate) | Percentage (0-100) of successful HTTP/HTTPS deliveries to log. | `number` | `null` | no |
| <a name="input_lambda_failure_feedback_role_arn"></a> [lambda\_failure\_feedback\_role\_arn](#input\_lambda\_failure\_feedback\_role\_arn) | IAM role ARN for Lambda failure feedback logging. | `string` | `""` | no |
| <a name="input_lambda_success_feedback_role_arn"></a> [lambda\_success\_feedback\_role\_arn](#input\_lambda\_success\_feedback\_role\_arn) | IAM role ARN for Lambda success feedback logging. | `string` | `""` | no |
| <a name="input_lambda_success_feedback_sample_rate"></a> [lambda\_success\_feedback\_sample\_rate](#input\_lambda\_success\_feedback\_sample\_rate) | Percentage (0-100) of successful Lambda deliveries to log. | `number` | `null` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Platform for the application; use 'GCM' for FCM. | `string` | `"GCM"` | no |
| <a name="input_platform_application_name"></a> [platform\_application\_name](#input\_platform\_application\_name) | Name for the SNS application (Platform Application). | `string` | n/a | yes |
| <a name="input_sms_default_sender_id"></a> [sms\_default\_sender\_id](#input\_sms\_default\_sender\_id) | Default sender ID for SMS. | `string` | `""` | no |
| <a name="input_sms_default_sms_type"></a> [sms\_default\_sms\_type](#input\_sms\_default\_sms\_type) | Default SMS type; can be 'Promotional' or 'Transactional'. | `string` | `""` | no |
| <a name="input_sms_monthly_spend_limit"></a> [sms\_monthly\_spend\_limit](#input\_sms\_monthly\_spend\_limit) | Monthly spending limit for SMS (in USD, as a string). | `string` | `""` | no |
| <a name="input_subscription_endpoint"></a> [subscription\_endpoint](#input\_subscription\_endpoint) | Endpoint for the SNS Topic subscription (email, URL, Lambda ARN, etc.). | `string` | `""` | no |
| <a name="input_subscription_protocol"></a> [subscription\_protocol](#input\_subscription\_protocol) | Protocol for the SNS Topic subscription (e.g., email, https, lambda). | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags for resources. | `map(string)` | `{}` | no |
| <a name="input_topic_data_protection_policy"></a> [topic\_data\_protection\_policy](#input\_topic\_data\_protection\_policy) | Data protection policy in JSON format for the SNS Topic. | `string` | `""` | no |
| <a name="input_topic_display_name"></a> [topic\_display\_name](#input\_topic\_display\_name) | Display name of the SNS Topic. | `string` | `""` | no |
| <a name="input_topic_name"></a> [topic\_name](#input\_topic\_name) | Name of the SNS Topic. | `string` | `""` | no |
| <a name="input_topic_policy"></a> [topic\_policy](#input\_topic\_policy) | Policy in JSON format for the SNS Topic. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_platform_application_arn"></a> [platform\_application\_arn](#output\_platform\_application\_arn) | ARN of the SNS platform application for FCM. |
| <a name="output_sms_preferences"></a> [sms\_preferences](#output\_sms\_preferences) | SMS preferences configuration (if set). |
| <a name="output_topic_arn"></a> [topic\_arn](#output\_topic\_arn) | ARN of the SNS topic (if created). |
| <a name="output_topic_policy_id"></a> [topic\_policy\_id](#output\_topic\_policy\_id) | ID of the SNS topic policy (if created). |
