
resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-postgres-subnets"
  subnet_ids = var.subnet_ids

  tags = {
    Name    = "${var.project_name}-postgres-subnets"
    Project = var.project_name
  }
}

resource "aws_security_group" "this" {
  name        = "${var.project_name}-postgres-sg"
  description = "Restricted PostgreSQL access"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL from the approved client IP"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.allowed_client_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "${var.project_name}-postgres-sg"
    Project = var.project_name
  }
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-postgres"

  engine         = "postgres"
  engine_version = "16"
  instance_class = var.instance_class

  allocated_storage = var.allocated_storage
  storage_type      = "gp3"
  storage_encrypted = true

  db_name                     = var.db_name
  username                    = var.db_username
  manage_master_user_password = true
  port                        = 5432

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  publicly_accessible = true
  multi_az            = false

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true

  tags = {
    Name    = "${var.project_name}-postgres"
    Project = var.project_name
  }
}
