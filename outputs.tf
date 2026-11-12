output "log_streams_id" {
  description = "Map of id values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.id }
}
output "log_streams_filters" {
  description = "Map of filters values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.filters }
}
output "log_streams_is_priority" {
  description = "Map of is_priority values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.is_priority }
}
output "log_streams_name" {
  description = "Map of name values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.name }
}
output "log_streams_pii_config" {
  description = "Map of pii_config values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => one(v.pii_config) }
}
output "log_streams_sink" {
  description = "Map of sink values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => one(v.sink) }
  sensitive   = true
}
output "log_streams_start_from" {
  description = "Map of start_from values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.start_from }
}
output "log_streams_status" {
  description = "Map of status values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.status }
}
output "log_streams_type" {
  description = "Map of type values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in auth0_log_stream.log_streams : k => v.type }
}

