variable "log_streams" {
  description = <<EOT
Map of log_streams, attributes below
Required:
    - name
    - type
    - sink (block):
        - aws_account_id (optional)
        - aws_partner_event_source (optional)
        - aws_region (optional)
        - azure_partner_topic (optional)
        - azure_region (optional)
        - azure_resource_group (optional)
        - azure_subscription_id (optional)
        - datadog_api_key (optional)
        - datadog_api_key_wo (optional)
        - datadog_api_key_wo_version (optional)
        - datadog_region (optional)
        - http_authorization (optional)
        - http_content_format (optional)
        - http_content_type (optional)
        - http_custom_headers (optional)
        - http_endpoint (optional)
        - mixpanel_project_id (optional)
        - mixpanel_region (optional)
        - mixpanel_service_account_password (optional)
        - mixpanel_service_account_username (optional)
        - segment_write_key (optional)
        - splunk_domain (optional)
        - splunk_port (optional)
        - splunk_secure (optional)
        - splunk_token (optional)
        - sumo_source_address (optional)
Optional:
    - filters
    - is_priority
    - start_from
    - status
    - pii_config (block):
        - algorithm (optional)
        - log_fields (required)
        - method (optional)
EOT

  type = map(object({
    name        = string
    type        = string
    filters     = optional(list(any))
    is_priority = optional(bool)
    start_from  = optional(string)
    status      = optional(string)
    sink = object({
      aws_account_id                    = optional(string)
      aws_partner_event_source          = optional(string)
      aws_region                        = optional(string)
      azure_partner_topic               = optional(string)
      azure_region                      = optional(string)
      azure_resource_group              = optional(string)
      azure_subscription_id             = optional(string)
      datadog_api_key                   = optional(string)
      datadog_api_key_wo                = optional(string)
      datadog_api_key_wo_version        = optional(number)
      datadog_region                    = optional(string)
      http_authorization                = optional(string)
      http_content_format               = optional(string)
      http_content_type                 = optional(string)
      http_custom_headers               = optional(list(any))
      http_endpoint                     = optional(string)
      mixpanel_project_id               = optional(string)
      mixpanel_region                   = optional(string)
      mixpanel_service_account_password = optional(string)
      mixpanel_service_account_username = optional(string)
      segment_write_key                 = optional(string)
      splunk_domain                     = optional(string)
      splunk_port                       = optional(string)
      splunk_secure                     = optional(bool)
      splunk_token                      = optional(string)
      sumo_source_address               = optional(string)
    })
    pii_config = optional(object({
      algorithm  = optional(string)
      log_fields = list(string)
      method     = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.status == null || (contains(["active", "paused", "suspended"], v.status))
      )
    ])
    error_message = "must be one of: \"active\", \"paused\", \"suspended\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.sink.aws_region == null || (contains(["ap-east-1", "ap-northeast-1", "ap-northeast-2", "ap-northeast-3", "ap-south-1", "ap-southeast-1", "ap-southeast-2", "ca-central-1", "cn-north-1", "cn-northwest-1", "eu-central-1", "eu-central-2", "eu-north-1", "eu-west-1", "eu-west-2", "eu-west-3", "me-south-1", "sa-east-1", "us-gov-east-1", "us-gov-west-1", "us-east-1", "us-east-2", "us-west-1", "us-west-2"], v.sink.aws_region))
      )
    ])
    error_message = "must be one of: \"ap-east-1\", \"ap-northeast-1\", \"ap-northeast-2\", \"ap-northeast-3\", \"ap-south-1\", \"ap-southeast-1\", \"ap-southeast-2\", \"ca-central-1\", \"cn-north-1\", \"cn-northwest-1\", \"eu-central-1\", \"eu-central-2\", \"eu-north-1\", \"eu-west-1\", \"eu-west-2\", \"eu-west-3\", \"me-south-1\", \"sa-east-1\", \"us-gov-east-1\", \"us-gov-west-1\", \"us-east-1\", \"us-east-2\", \"us-west-1\", \"us-west-2\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.sink.azure_region == null || (contains(["australiacentral", "australiaeast", "australiasoutheast", "brazilsouth", "canadacentral", "canadaeast", "centralindia", "centralus", "eastasia", "eastus", "eastus2", "francecentral", "germanywestcentral", "japaneast", "japanwest", "koreacentral", "koreasouth", "northcentralus", "northeurope", "norwayeast", "southafricanorth", "southcentralus", "southeastasia", "southindia", "switzerlandnorth", "uaenorth", "uksouth", "ukwest", "westcentralus", "westeurope", "westindia", "westus", "westus2"], v.sink.azure_region))
      )
    ])
    error_message = "must be one of: \"australiacentral\", \"australiaeast\", \"australiasoutheast\", \"brazilsouth\", \"canadacentral\", \"canadaeast\", \"centralindia\", \"centralus\", \"eastasia\", \"eastus\", \"eastus2\", \"francecentral\", \"germanywestcentral\", \"japaneast\", \"japanwest\", \"koreacentral\", \"koreasouth\", \"northcentralus\", \"northeurope\", \"norwayeast\", \"southafricanorth\", \"southcentralus\", \"southeastasia\", \"southindia\", \"switzerlandnorth\", \"uaenorth\", \"uksouth\", \"ukwest\", \"westcentralus\", \"westeurope\", \"westindia\", \"westus\", \"westus2\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.sink.http_content_format == null || (contains(["JSONLINES", "JSONARRAY", "JSONOBJECT"], v.sink.http_content_format))
      )
    ])
    error_message = "must be one of: \"JSONLINES\", \"JSONARRAY\", \"JSONOBJECT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.sink.datadog_region == null || (contains(["us", "eu", "us3", "us5"], v.sink.datadog_region))
      )
    ])
    error_message = "must be one of: \"us\", \"eu\", \"us3\", \"us5\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.pii_config == null || (alltrue([for x in v.pii_config.log_fields : contains(["first_name", "last_name", "username", "email", "phone", "address"], x)]))
      )
    ])
    error_message = "must be one of: \"first_name\", \"last_name\", \"username\", \"email\", \"phone\", \"address\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.pii_config == null || (v.pii_config.method == null || (contains(["hash", "mask"], v.pii_config.method)))
      )
    ])
    error_message = "must be one of: \"hash\", \"mask\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.pii_config == null || (v.pii_config.algorithm == null || (contains(["xxhash"], v.pii_config.algorithm)))
      )
    ])
    error_message = "must be one of: \"xxhash\""
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

