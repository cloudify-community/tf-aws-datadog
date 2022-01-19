output "lb_dns" {
    description = "Load balancer DNS name"
    value       = aws_lb.app_lb.dns_name
}