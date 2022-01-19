data "datadog_dashboard" "dashboard" {
  name       = "Web Performance Dashboard - ${var.app_name}"
  depends_on = [datadog_dashboard_json.dashboard_json]
}