# Operations Runbook

## Validate configuration

```bash
terraform fmt -check
terraform init -backend=false
terraform validate
```

## Plan changes

```bash
terraform init
terraform plan
```

Review all creates, updates, and destroys before applying.

## Deploy

```bash
terraform apply
```

## Verify

```bash
bash scripts/verify.sh
```

## Troubleshooting

### Application URL does not respond

1. Confirm the instance is running.
2. Confirm the public IP in `terraform output`.
3. Review the security group HTTP rule.
4. Inspect EC2 system logs and verify NGINX is running.

### Terraform cannot authenticate to AWS

Run:

```bash
aws sts get-caller-identity
```

and correct the active AWS profile or environment credentials.

### Unexpected drift

Run:

```bash
terraform plan
```

Review any out-of-band changes before reconciling them.

## Teardown

```bash
terraform destroy
```

Confirm that EC2, CloudWatch, IAM, S3, and networking resources are removed.
