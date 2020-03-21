variable "region" {
	description = "The region to deploy the Terraform plan into."
}

variable "cidr_ip" {
    description = "CIDR IP Range"
    type        = string
}

variable "ami" {
    description = "AMI Image name"
    type        = string
}

variable "conf_name" {
    description = "Launch Configuration Name"
    type        = string
}

variable "instance_type" {
    description = "AMI instance type"
    type        = string
    default     = "t2.micro"
}

variable "name" {
    description = " ASG Name"
    type        = string
}

variable "max_size" {
    description = "EC2 Instance maximum size"
    type        = number
    default     = 2
}

variable "min_size" {
    description = "EC2 Instance minimum size"
    type        = number
    default     = 1
}

variable "grace_period" {
    description = "EC2 Instance grace period"
    type        = number
    default     = 300
}

variable "capacity" {
    description = "EC2 Instance desired capacity"
    type        = number
    default     = 2
}

variable "delete" {
    description = "EC2 Instance force delete"
    type        = bool
    default     = true
}

variable "subnets" {
    description = "EC2 Instance subnets"
    type        = list(string)
    default     = []
}

variable "user_data" {
    description = "Package and config instructions"
    type        = string
}

variable "sg" {
    description = "SG for ASG Instances"
    type        = list(string)
    default     = []
}

variable "profile" {
    description = "IAM Profile for ASG Instances"
    type        = string
}

variable "key_name" {
    description = "Key pair for ASG Instances"
    type        = string
}

variable "tg_arn" {
    description = "Target Group ARN for Instance attachment"
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

variable "disk_size" {
    description = "Volume Storage size for ASG instances"
    type        = string
    default     = "15"
}
