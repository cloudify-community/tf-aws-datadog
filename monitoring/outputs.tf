output "dashboard_url" {
    description = "DataDog Dashboard URL"
    value       = data.datadog_dashboard.dashboard.url
}