# Architecture

The lab creates one small public application tier in AWS for demonstrating infrastructure-as-code and operational controls.

## Components

- **VPC** — isolated network boundary
- **Public subnet** — hosts the demonstration EC2 instance
- **Internet Gateway + route table** — provides outbound and inbound internet routing
- **Security group** — allows HTTP; SSH is disabled unless an explicit administrator CIDR is supplied
- **EC2** — Amazon Linux 2023 host running a minimal NGINX page
- **IAM role** — gives the instance scoped access to the project S3 bucket and CloudWatch log group
- **S3** — artifact storage with versioning and public access blocking
- **CloudWatch** — log group and CPU alarm
- **GitHub Actions** — validates Terraform syntax and formatting

## Operational flow

1. Terraform plans the desired state.
2. Terraform provisions networking, security, compute, storage, IAM, and monitoring resources.
3. EC2 bootstraps NGINX through user data.
4. Operators verify HTTP reachability and resource state.
5. CloudWatch tracks EC2 CPU utilization.
6. Terraform destroys the environment when the exercise is complete.
