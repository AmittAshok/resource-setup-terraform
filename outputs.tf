
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.mlops.id
}

output "public_ip" {
  description = "EC2 public IPv4 address"
  value       = aws_instance.mlops.public_ip
}

output "public_dns" {
  description = "EC2 public DNS name"
  value       = aws_instance.mlops.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i <path-to-private-key.pem> ubuntu@${aws_instance.mlops.public_ip}"
}

output "postgres_endpoint" {
  description = "PostgreSQL RDS endpoint"
  value       = module.postgres.endpoint
}

output "postgres_port" {
  description = "PostgreSQL port"
  value       = module.postgres.port
}

output "postgres_database_name" {
  description = "PostgreSQL database name"
  value       = module.postgres.database_name
}

output "postgres_security_group_id" {
  description = "PostgreSQL security group ID"
  value       = module.postgres.security_group_id
}
output "postgres_secret_arn" {
  description = "Secrets Manager ARN for PostgreSQL credentials"
  value       = module.postgres.master_user_secret_arn
}