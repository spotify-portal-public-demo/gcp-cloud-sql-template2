output "cloud_sql_name" {
  value       = google_sql_database_instance.${{ values.component_id }}.name
  description = "Cloud SQL Name"
}

output "cloud_sql_public_ip" {
  value       = google_sql_database_instance.${{ values.component_id }}.public_ip_address
  description = "Cloud SQL Public IP"
}
