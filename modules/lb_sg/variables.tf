variable "region" {
	description = "The region to deploy the Terraform plan into."
}

variable "cidr_ip" {
    description = "CIDR IP Range"
    type        = string
}

variable "name" {
    description = "LB Security Group name"
    type        = string
}
 
variable "description" {
    description = "LB Security Group description"
    type        = string
    default     = "List of ports allowed to access the service"
}

variable "vpc_id" {
    description = "VPC Identifier"
    type        = string
}

variable "environment" {
    description = "Deployment Environment"
    type        = string
    default     = "Prod"
}

variable "project_name" {
    description = "Project Name for ASG Instances"
    type        = string
}

