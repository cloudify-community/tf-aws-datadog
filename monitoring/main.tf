resource "datadog_dashboard_json" "dashboard_json" {
  dashboard = templatefile("${path.module}/resources/dashboard.json.tftpl", {app_name = var.app_name})
}