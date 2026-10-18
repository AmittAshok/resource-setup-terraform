
variable "project_name" {
  description = "Project name for resource naming and tags"
  type        = string
}

variable "vpc_id" {
  description = "VPC in which to create PostgreSQL resources"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "allowed_client_cidr" {
  description = "Public IPv4 CIDR allowed to connect to PostgreSQL"
  type        = string
}

variable "db_name" {
  description = "Initial PostgreSQL database name"
  type        = string
  default     = "mlopsdb"
}

variable "db_username" {
  description = "PostgreSQL master username"
  type        = string
  default     = "mlopsadmin"
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Initial allocated storage in GiB"
  type        = number
  default     = 20
}
