
/*
 * this file contains all the information this module will export to the
 * calling Terraform plan to reference.  Eg:
 *
 * output "group_arn" {
 *     value = "${ aws_iam_group.wdi_iam_group.arn }"
 * }
 */

 output "id" {
    value = "${ aws_security_group.lb_sg.id }"
 }