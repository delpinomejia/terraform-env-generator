
variable "region" {
	description = "The region to deploy the Terraform plan into."
}

variable "ami" {
    description = "AMI Image name"
    type        = string
}

variable "instance_type" {
    description = "AMI instance type"
    type        = string
    default     = "t2.micro"
}

variable "max_size" {
    description = "EC2 Instance maximum size"
    type        = number
    default     = 4
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

variable "environment" {
    description = "Deployment Environment"
    type        = string
    default     = "Prod"
}

variable "cidr_ip" {
    description = "CIDR IP Range"
    type        = string
}

variable "delete" {
    description = "EC2 Instance force delete"
    type        = bool
    default     = true
}

variable "port" {
    description = "Target Group Health check port"
    type        = number
}

variable "protocol" {
    description = "Communication Protocol for Target Group"
    type        = string
}
 
variable "tg_cidr_block" {
    description = "CIDR Block for Target Group"
    type        = string
}

variable "key_name" {
    description = "Key pair for ASG Instances"
    type        = string
}

variable "certificate" {
    description = "Listener Certificate for Target Group"
    type        = string
}

variable "action" {
    description = "Listener Action for Target Group"
    type        = string
    default     = "forward"
}

variable "ssl_policy" {
    description = "Listener SSL Policy for Target Group"
    type        = string
    default     = "ELBSecurityPolicy-2016-08"
}

variable "listener_port" {
    description = "Listener Port for Target Group"
    type        = number
}

variable "listener_protocol" {
    description = "Listener Protocol for Target Group"
    type        = string
}

variable "protection" {
    description = "LB deletion protection"
    type        = bool
    default     = true
}

variable "lb_type" {
    description = "LB type"
    type        = string
    default     = "application"
}

variable "project_name" {
    description = "Project Name for ASG Instances"
    type        = string
}

variable "lb_sg" {
    description = "Security Groups for LB"
    type        = list(string)
    default     = []
}

variable "disk_size" {
    description = "Volume Storage size for ASG instances"
    type        = string
    default     = "15"
}

variable "bucket_name" {
    description = "Bucket name for State file"
    type        = string
}

variable "subnets" {
    description = "EC2 Instance subnets"
    type        = list(string)
    default     = []
}

variable "lb_subnets" {
    description = "LB Instance subnets"
    type        = list(string)
    default     = []
}

variable "profile" {
    description = "IAM Profile for ASG Instances"
    type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  type        = list
}

variable "private_subnet_cidr" {
  description = "CIDR for the private subnet"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  type        = list
}