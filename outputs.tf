
output "vpc_id" {
  description = "Created VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "ec2_instance_id" {
  description = "Private EC2 instance ID"
  value       = aws_instance.main.id
}

output "ssm_endpoint_ids" {
  description = "SSM interface endpoint IDs"
  value = {
    for service, endpoint in aws_vpc_endpoint.ssm :
    service => endpoint.id
  }
}

output "ssm_connection_command" {
  description = "Command to start an SSM session from AWS CLI"
  value       = "aws ssm start-session --target ${aws_instance.main.id} --region ${var.aws_region}"
}
