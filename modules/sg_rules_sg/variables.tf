
variable "sg_type" {
    description = "SG Access Type"
    type        = string
    default     = "ingress"
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

variable "source_sg_id" {
    description = "SG Source for Rules"
    type        = string
}



