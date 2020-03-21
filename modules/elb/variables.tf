variable "region" {
	description = "The region to deploy the Terraform plan into."
}

variable "cidr_ip" {
    description = "CIDR IP Range"
    type        = string
}

variable "name" {
    description = "LB name"
    type        = string
}
 
variable "description" {
    description = "LB description"
    type        = string
    default     = "Load Balancer rules for the resource"
}

variable "lb_sg" {
    description = "Security Groups for LB"
    type        = string
}

variable "internal" {
    description = "LB type (internal or External)"
    type        = bool
    default     = false
}

variable "lb_subnets" {
    description = " Subnets for LB"
    type        = list(string)
    default     = []
}

variable "protection" {
    description = "LB deletion protection"
    type        = bool
    default     = true
}

variable "s3_bucket" {
    description = " Bucket for LB logs"
    type        = string
    default     = ""
}
 
variable "port" {
    description = "Target Group Health check port"
    type        = number
}

variable "protocol" {
    description = "Communication Protocol for Target Group"
    type        = string
}

variable "vpc_id" {
    description = "VPC Identifier for Target Group"
    type        = string
}

variable "listener_port" {
    description = "Listener Port for Target Group"
    type        = number
}

variable "listener_protocol" {
    description = "Listener Protocol for Target Group"
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

variable "lb_type" {
    description = "LB type"
    type        = string
    default     = "application"
}

variable "environment" {
    description = "Deployment Environment"
    type        = string
    default     = "Prod"
}

variable "ssl_policy" {
    description = "Listener SSL Policy for Target Group"
    type        = string
    default     = "ELBSecurityPolicy-2016-08"
}

variable "project_name" {
    description = "Project Name for ASG Instances"
    type        = string
}
