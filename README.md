## terraform-aws-vpc-ssm-endpoint

Terraform + AWS VPC + SSM Endpoint

Project Overview

This project uses Terraform to provision a secure AWS VPC environment with public and private subnets, a private EC2 instance, and AWS Systems Manager (SSM) VPC interface endpoints.

The EC2 instance can be managed through AWS Systems Manager Session Manager without requiring a public IP address or inbound SSH access.

## Architecture

"Terraform AWS VPC SSM Endpoint Architecture" (Architecture.png)

AWS Services Used

- Amazon VPC
- Public and Private Subnets
- Internet Gateway
- NAT Gateway
- Amazon EC2
- AWS Systems Manager (SSM)
- SSM Interface VPC Endpoints
- IAM Roles and Instance Profiles
- Security Groups
- Terraform

Network Configuration

Resource| Configuration
AWS Region| ap-south-1
VPC CIDR| 10.0.0.0/16
Public Subnet| 10.0.1.0/24
Private Subnet| 10.0.2.0/24
EC2 Instance| Private subnet, no public IP
SSM Access| Interface VPC endpoints

Deployment

Prerequisites: Terraform, AWS CLI, and an AWS account configured with suitable permissions.

terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply

Review the plan and type "yes" when Terraform requests confirmation.

Connect to EC2

After deployment, use the AWS CLI with an identity authorized to start SSM sessions:

aws ssm start-session \
  --target <EC2_INSTANCE_ID> \
  --region ap-south-1

The instance must appear as a managed, online instance in Systems Manager. Ensure the AWS CLI Session Manager plugin is installed where required.

Cleanup

To remove the resources created by Terraform:

terraform destroy

Review the proposed deletions and confirm when prompted.

Key Learnings

- Infrastructure as Code with Terraform
- AWS VPC and subnet configuration
- Public and private routing
- NAT Gateway configuration
- IAM roles for EC2
- Secure EC2 administration with AWS Systems Manager
- Interface VPC endpoints and private DNS
- Security group configuration

Cost Warning

NAT Gateways and interface VPC endpoints incur charges. EC2, public IPv4 addresses where applicable, and other resources may also incur costs. Review AWS pricing and destroy resources when the project is no longer needed.

Author

Pratiksha Pawar 

Created as a hands-on AWS and Terraform infrastructure project.
