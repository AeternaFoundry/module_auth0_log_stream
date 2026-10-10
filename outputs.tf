output "log_streams_id" {
  description = "Map of id values across all log_streams, keyed the same as var.log_streams except keys with no id are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "log_streams_filters" {
  description = "Map of filters values across all log_streams, keyed the same as var.log_streams except keys with no filters are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.filters if v.filters != null && length(v.filters) > 0 }
}
output "log_streams_is_priority" {
  description = "Map of is_priority values across all log_streams, keyed the same as var.log_streams except keys with no is_priority are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.is_priority if v.is_priority != null }
}
output "log_streams_name" {
  description = "Map of name values across all log_streams, keyed the same as var.log_streams except keys with no name are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "log_streams_pii_config" {
  description = "Map of pii_config values across all log_streams, keyed the same as var.log_streams except keys with no pii_config are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => one(v.pii_config) if v.pii_config != null && length(v.pii_config) > 0 }
}
output "log_streams_sink" {
  description = "Map of sink values across all log_streams, keyed the same as var.log_streams except keys with no sink are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => one(v.sink) if v.sink != null && length(v.sink) > 0 }
  sensitive   = true
}
output "log_streams_start_from" {
  description = "Map of start_from values across all log_streams, keyed the same as var.log_streams except keys with no start_from are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.start_from if v.start_from != null && length(v.start_from) > 0 }
}
output "log_streams_status" {
  description = "Map of status values across all log_streams, keyed the same as var.log_streams except keys with no status are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.status if v.status != null && length(v.status) > 0 }
}
output "log_streams_type" {
  description = "Map of type values across all log_streams, keyed the same as var.log_streams except keys with no type are omitted"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.type if v.type != null && length(v.type) > 0 }
}

