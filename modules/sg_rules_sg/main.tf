
resource "aws_security_group_rule" "sg_rule_sg" {


  type                     = "${ var.sg_type }"
  from_port                = "${ var.from_port }"
  to_port                  = "${ var.to_port }"
  protocol                 = "${ var.protocol }"
  security_group_id        = "${ var.sg_id }"
  source_security_group_id = "${ var.source_sg_id }"
}