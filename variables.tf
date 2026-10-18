
variable "aws_region" {
  description = "AWS region for MLOps learning"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.large"
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Public IPv4 address allowed to SSH, in CIDR notation"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.allowed_ssh_cidr))
    error_message = "Provide a valid IPv4 CIDR, such as your-public-ip/32."
  }
}

variable "root_volume_size" {
  description = "EC2 root volume size in GiB"
  type        = number
  default     = 30
}

variable "project_name" {
  description = "Name used for AWS resource tags"
  type        = string
  default     = "mlops-learning"
}

variable "allowed_db_cidr" {
  description = "Public IPv4 CIDR allowed to access RDS PostgreSQL"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.allowed_db_cidr))
    error_message = "Provide a valid IPv4 CIDR, such as your-public-ip/32."
  }
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


variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}
