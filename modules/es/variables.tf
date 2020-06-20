variable "vpc" {
  description = "VPC ID where to launch ElasticSearch cluster"
}

variable "vpc_cidr" {
  description = "CIDR to allow connections to ElasticSearch"
}

variable "region" {
  description = "AWS region to use"
}

variable "es_domain" {
  description = "ElasticSearch domain name"
}

variable "es_subnets" {
  type = "list"
  description = "List of VPC Subnet IDs to create ElasticSearch Endpoints in"
}
