
variable "sg_type" {
    description = "SG Access Type"
    type        = string
    default     = "ingress"
}

variable "cidr_ip" {
    description = "CIDR IP Range"
    type        = string
}

variable "protocol" {
    description = "SG Internet protocol"
    type        = string
    default     = "tcp"
}

variable "from_port" {
    description = "SG Starting Ports"
    type        = string
}

variable "to_port" {
    description = "SG Ending Ports"
    type        = string
}

variable "sg_id" {
    description = "SG Identifier"
    type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR for the public subnet"
  default = "10.0.1.0/24"
}



