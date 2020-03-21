
/*
 * this file contains all the information this module will export to the
 * calling Terraform plan to reference.  Eg:
 *
 * output "group_arn" {
 *     value = "${ aws_iam_group.wdi_iam_group.arn }"
 * }
 */

output "target_group_arn" {
    value = "${ aws_lb_target_group.target_group.arn }"
}