
resource "aws_launch_configuration" "conf" {
  
  name_prefix          = "${ var.conf_name }-"
  image_id             = "${ var.ami }"
  instance_type        = "${ var.instance_type }"
  security_groups      = "${ var.sg }"
  user_data            = "${ var.user_data }"
  iam_instance_profile = "${ var.profile }"
  key_name             = "${ var.key_name }"
  root_block_device {
        volume_type = "standard"
        volume_size = "${ var.disk_size }"
    }
    lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "asg" {
  name                      = "${ var.name }"
  max_size                  = "${ var.max_size }"
  min_size                  = "${ var.min_size }"
  health_check_grace_period = "${ var.grace_period }"
  health_check_type         = "EC2"
  desired_capacity          = "${ var.capacity }"
  force_delete              = "${ var.delete }"
  launch_configuration      = "${ aws_launch_configuration.conf.name }"
  vpc_zone_identifier       = "${ var.subnets }"
  termination_policies      = ["NewestInstance"]
  target_group_arns         = ["${ var.tg_arn }"]
  
  tag {
    key                 = "Name"
    value               = "${ var.environment}-${ var.project_name }-EC2"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = "${ var.project_name }"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "${ var.environment }"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }
}

