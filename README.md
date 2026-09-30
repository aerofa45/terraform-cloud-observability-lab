# Terraform Cloud Infrastructure & Observability Lab

A portfolio project that provisions a small AWS environment with Terraform and demonstrates networking, IAM, compute, storage, monitoring, alerting, and CI validation.

## Architecture

```text
Internet
   |
Internet Gateway
   |
Public Subnet
   |
EC2 Application Host
   |
Security Group
   |
CloudWatch Logs / Metrics / Alarm

Supporting services
- S3 bucket for application artifacts
- IAM instance role with scoped S3 and CloudWatch permissions
- VPC, route table, subnet, and security controls
- GitHub Actions for Terraform formatting and validation
```

## What this project demonstrates

- Infrastructure as Code with Terraform
- AWS VPC, subnet, route table, and Internet Gateway configuration
- Security-group design with restricted inbound access
- EC2 provisioning with an IAM instance profile
- S3 storage with public access blocked and versioning enabled
- CloudWatch log group and CPU alarm
- Reusable variables, outputs, and environment configuration
- CI checks for `terraform fmt` and `terraform validate`
- Cost-aware teardown with `terraform destroy`

## Repository structure

```text
.
├── .github/workflows/terraform.yml
├── docs/
│   ├── ARCHITECTURE.md
│   └── OPERATIONS_RUNBOOK.md
├── scripts/
│   └── verify.sh
├── .gitignore
├── main.tf
├── outputs.tf
├── terraform.tfvars.example
├── variables.tf
└── versions.tf
```

## Prerequisites

- Terraform 1.6+
- AWS CLI
- An AWS account and credentials configured locally

Verify access:

```bash
aws sts get-caller-identity
terraform version
```

## Deploy

```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

After deployment, run:

```bash
bash scripts/verify.sh
```

## Destroy

```bash
terraform destroy
```

The example defaults use a small EC2 instance type, but AWS resources can still incur charges. Review the plan before applying and destroy resources when testing is complete.

## Security notes

- S3 public access is blocked.
- EC2 uses an IAM role instead of embedded credentials.
- SSH access is disabled by default. Set `admin_cidr` only when remote administration is required.
- The instance role is scoped to the project bucket and CloudWatch logging actions.
- Sensitive values and Terraform state are excluded from version control.

## Validation

The CI workflow runs Terraform formatting and configuration validation on pull requests and pushes that modify Terraform files.
