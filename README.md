# Terraform Complete Environment Generator

Using this repo, you'll be able to quickly set up a Terraform environment with the following AWS resources:

1. Full VPC with Internet Gateway
2. Public subnets on Different Availability Zone (region can be changed within the vars.tfvars file)
3. Private Subnets on Different Availability Zone (region can be changed within the vars.tfvars file)
4. Application Load Balancer with HTTPS Listener, Policy and SSL Certificate (certificate must be provided in vars.tfvars file)
5. ALB security Group with HTTP and HTTPS enabled on Public Subnets
6. Target Group for the ALB
7. Autoscaling Group with 2 EC2 instances on Private Subnets
8. t2.micro EC2 Instances with custom AMI (both Instance size and AMI can be customized in vars.tfvars file)
9. User data script to be executed at creation time, with simple package dependencies (feel free to add more packages)
