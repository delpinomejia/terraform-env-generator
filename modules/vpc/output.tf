
/*
 * this file contains all the information this module will export to the
 * calling Terraform plan to reference.  Eg:
 *
 * output "group_arn" {
 *     value = "${ aws_iam_group.wdi_iam_group.arn }"
 * }
 */

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${ aws_vpc.env_vpc.id }"
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = "${ aws_subnet.private-subnet.*.id }"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = "${ aws_subnet.public-subnet.*.id }"
}
