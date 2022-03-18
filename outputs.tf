output "lb_dns" {
  description = "DNS endpoint for Load Balancer"
  value       = "http://${module.load_balancer.lb_dns}"
}

output "dashboard_url" {
  description = "DataDog Dashboard URL"
  value       = "https://app.datadoghq.com${module.monitoring_dashboard.dashboard_url}"
}

output "repo_url" {
  description = "GitHub Repository URL"
  value       = module.repository.repo_url
}
