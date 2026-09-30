#!/usr/bin/env bash
set -euo pipefail

URL=$(terraform output -raw application_url)
BUCKET=$(terraform output -raw s3_bucket_name)
INSTANCE=$(terraform output -raw instance_id)

echo "Checking web endpoint: $URL"
curl --fail --silent --show-error "$URL"

echo
echo "Checking EC2 instance: $INSTANCE"
aws ec2 describe-instances --instance-ids "$INSTANCE" --query "Reservations[0].Instances[0].State.Name" --output text

echo "Checking S3 bucket: $BUCKET"
aws s3api head-bucket --bucket "$BUCKET"

echo "Verification complete."
