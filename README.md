# AWS Infrastructure with Terraform

This project uses Terraform to provision AWS infrastructure for MLOps learning.

## Architecture

- **EC2:** Ubuntu instance with Docker, kubectl, Kind, Helm, AWS CLI, and Python.
- **Amazon RDS:** PostgreSQL database for application and MLOps experiments.
- **AWS Secrets Manager:** Manages the RDS master password.
- **Terraform Modules:** Reusable PostgreSQL module for managing database resources.

## Project Structure

```text
.
├── main.tf
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── rds.tf
├── terraform.tfvars.example
├── scripts/
│   └── user_data.sh
└── modules/
    └── postgres/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

## Prerequisites

- AWS account
- AWS CLI configured
- Terraform installed
- Existing EC2 key pair
- Public IP address for SSH and database access

## Setup

1. Clone this repository.

2. Configure AWS credentials:

   ```bash
   aws configure
   ```

3. Create your local variables file:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

4. Update `terraform.tfvars` with your AWS region, key pair name, and allowed IP addresses.

5. Initialize Terraform:

   ```bash
   terraform init
   ```

6. Validate the configuration:

   ```bash
   terraform fmt -recursive
   terraform validate
   ```

7. Preview the changes:

   ```bash
   terraform plan
   ```

8. Provision the infrastructure:

   ```bash
   terraform apply
   ```

## Useful Commands

```bash
terraform output
terraform plan
terraform destroy
```

## Security Notes

- Restrict SSH and PostgreSQL access to trusted IP addresses.
- Do not commit passwords, private keys, or Terraform state files.
- Use AWS Secrets Manager for database credentials.
- Review AWS costs before provisioning resources.

## Purpose

This project is part of my MLOps learning journey, focusing on Infrastructure as Code, AWS, Docker, Kubernetes, PostgreSQL, and automation.
