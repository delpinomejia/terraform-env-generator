
resource "aws_lb" "elb" {
  name               = "${ var.name }"
  internal           = "${ var.internal }"
  load_balancer_type = "${ var.lb_type }"
  security_groups    = ["${ var.lb_sg }"]
  subnets            = "${ var.lb_subnets }"
  #interval           = 90
  
  tags = {
    Name             = "${ var.name }"
    Project          = "${ var.project_name }"
    Environment      = "${ var.environment }"
  } 

  enable_deletion_protection = "${ var.protection }"

  access_logs {
    bucket  = "${ var.s3_bucket }"
    prefix  = "${ var.name }-s3"
    enabled = "${ length(var.s3_bucket) > 0 ? true : false }"  
  }
}
resource "aws_lb_target_group" "target_group" {
  name                   = "${ var.name }-TG"
  port                   = "${ var.port }"
  protocol               = "${ var.protocol }"
  vpc_id                 = "${ var.vpc_id }"
  deregistration_delay   = 30
  stickiness {
    type                  = "lb_cookie"
    cookie_duration       = 86400 
  }
 
  health_check {
    port                = 9200
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher = "200,301,302,404"  
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = "${ aws_lb.elb.arn }"
  port              = "${ var.listener_port }"
  protocol          = "${ var.listener_protocol }"
  ssl_policy        = "${ var.ssl_policy }"
  certificate_arn   = "${ var.certificate }"

  default_action {
    type             = "${ var.action }"
    target_group_arn = "${ aws_lb_target_group.target_group.arn }"
  }
}

resource "aws_lb_listener" "listener-http" {
  load_balancer_arn = "${ aws_lb.elb.arn }"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "${ var.action }"
    target_group_arn = "${ aws_lb_target_group.target_group.arn }"
  }
}