resource "auth0_log_stream" "log_streams" {
  for_each = var.log_streams

  name        = each.value.name
  type        = each.value.type
  filters     = each.value.filters
  is_priority = each.value.is_priority
  start_from  = each.value.start_from
  status      = each.value.status

  sink {
    aws_account_id                    = each.value.sink.aws_account_id
    aws_partner_event_source          = each.value.sink.aws_partner_event_source
    aws_region                        = each.value.sink.aws_region
    azure_partner_topic               = each.value.sink.azure_partner_topic
    azure_region                      = each.value.sink.azure_region
    azure_resource_group              = each.value.sink.azure_resource_group
    azure_subscription_id             = each.value.sink.azure_subscription_id
    datadog_api_key                   = each.value.sink.datadog_api_key
    datadog_api_key_wo                = each.value.sink.datadog_api_key_wo
    datadog_api_key_wo_version        = each.value.sink.datadog_api_key_wo_version
    datadog_region                    = each.value.sink.datadog_region
    http_authorization                = each.value.sink.http_authorization
    http_content_format               = each.value.sink.http_content_format
    http_content_type                 = each.value.sink.http_content_type
    http_custom_headers               = each.value.sink.http_custom_headers
    http_endpoint                     = each.value.sink.http_endpoint
    mixpanel_project_id               = each.value.sink.mixpanel_project_id
    mixpanel_region                   = each.value.sink.mixpanel_region
    mixpanel_service_account_password = each.value.sink.mixpanel_service_account_password
    mixpanel_service_account_username = each.value.sink.mixpanel_service_account_username
    segment_write_key                 = each.value.sink.segment_write_key
    splunk_domain                     = each.value.sink.splunk_domain
    splunk_port                       = each.value.sink.splunk_port
    splunk_secure                     = each.value.sink.splunk_secure
    splunk_token                      = each.value.sink.splunk_token
    sumo_source_address               = each.value.sink.sumo_source_address
  }

  dynamic "pii_config" {
    for_each = each.value.pii_config != null ? [each.value.pii_config] : []
    content {
      algorithm  = pii_config.value.algorithm
      log_fields = pii_config.value.log_fields
      method     = pii_config.value.method
    }
  }
}

