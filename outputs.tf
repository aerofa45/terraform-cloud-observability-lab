output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = aws_instance.app.public_ip
}

output "application_url" {
  value = "http://${aws_instance.app.public_ip}"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.artifacts.bucket
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.app.name
}
