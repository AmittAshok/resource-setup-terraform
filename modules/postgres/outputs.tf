
output "endpoint" {
  description = "RDS PostgreSQL endpoint hostname"
  value       = aws_db_instance.this.address
}

output "port" {
  description = "PostgreSQL port"
  value       = aws_db_instance.this.port
}

output "database_name" {
  description = "Initial database name"
  value       = aws_db_instance.this.db_name
}

output "security_group_id" {
  description = "RDS security group ID"
  value       = aws_security_group.this.id
}
output "master_user_secret_arn" {
  description = "Secrets Manager ARN for the RDS master password"
  value       = aws_db_instance.this.master_user_secret[0].secret_arn
}