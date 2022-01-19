output "vpc" {
  description = "VPC ID"
  value       = aws_vpc.app_vpc.id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

output "public_subnets" {
  description = "Public subnet IDs"
  value = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output security_group {
  description = "Web security group ID"
  value       = aws_security_group.web_sg.id
}