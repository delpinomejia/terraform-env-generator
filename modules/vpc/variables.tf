variable "region" {
	description = "The region to deploy the Terraform plan into."
}

variable "cidr_ip" {
  description = "CIDR IP Range"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list
}

variable "availability_zones" {
  description = "AZs in this region to use"
  default = ["us-west-2a", "us-west-2b"]
  type = list
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  type        = list
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
