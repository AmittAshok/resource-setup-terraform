
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "postgres" {
  source = "./modules/postgres"

  project_name        = var.project_name
  vpc_id              = data.aws_vpc.default.id
  subnet_ids          = data.aws_subnets.default.ids
  allowed_client_cidr = var.allowed_db_cidr

  db_name        = var.db_name
  db_username    = var.db_username
  instance_class = var.db_instance_class
}
