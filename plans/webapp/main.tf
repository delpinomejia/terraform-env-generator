/* Setup the provider */
provider "aws" {
	region = var.region
}

# /* Define the remote storage for this plan's Terraform state file */
# Remove the comment if the table isn't created

# module "dynamodb" {
# 	source = "../../modules/dynamodb"
# }

terraform {
	backend "s3" {
		bucket  = "tm-devops" 
		key     = "plans/webapp/"
		region  = "us-west-2"
		dynamodb_table = "terraform-lock"
		encrypt = true
	}
}

data "aws_vpc" "env_vpc" {
  id = "${ module.env_vpc.vpc_id }"
}

module "env_vpc" {
	source = "../../modules/vpc"
    
    region          = "${ var.region }"
	cidr_ip         = "${ var.cidr_ip }"
	environment     = "${ var.environment }"
	project_name    = "${ var.project_name }"
}

module "env_asg" {
  source = "../../modules/asg"
  
  	ami                  = "${ var.ami }"
    region               = "${ var.region }"
    cidr_ip              = "${ var.cidr_ip }"
	conf_name            = "${ var.environment }-${ var.project_name }-LaunchConfig"
	instance_type        = "${ var.instance_type }"
	name                 = "${ var.environment }-${ var.project_name }-ASG"
	max_size             = "${ var.max_size }"
	min_size             = "${ var.min_size }"
	grace_period         = "${ var.grace_period }"
	capacity             = "${ var.capacity }"
	delete               = "${ var.delete }"
	user_data            = "${ file("files/user-data.sh") }"
	profile              = "${ var.profile }"
	key_name             = "${ var.key_name }"
	tg_arn               = "${ module.env_elb.target_group_arn }"
	sg                   = ["${ module.env_sg.id }"]
	environment          = "${ var.environment }"
	disk_size            = "${ var.disk_size }"
	project_name         = "${ var.project_name }"
    subnets              = flatten(["${ module.env_vpc.private_subnets }"]) 
}

module "env_elb" {
	source = "../../modules/elb"

	name              = "${ var.environment }-${ var.project_name }-LB"
    region            = "${ var.region }"
    cidr_ip           = "${ var.cidr_ip }"
	lb_sg             = "${ module.env_lb_sg.id }"
	lb_type           = "${ var.lb_type }"
	port              = "${ var.port }"
	protocol          = "${ var.protocol }"
	vpc_id            = "${ module.env_vpc.vpc_id }"
	listener_port     = "${ var.listener_port }"
    listener_protocol = "${ var.listener_protocol }"
	ssl_policy        = "${ var.ssl_policy }"
    certificate       = "${ var.certificate }"
	protection        = "${ var.protection }"
    project_name      = "${ var.project_name }"
    lb_subnets        = flatten(["${ module.env_vpc.public_subnets }"]) 
}

module "env_lb_sg" {
	source = "../../modules/lb_sg"
    
    region          = "${ var.region }"
    cidr_ip         = "${ var.cidr_ip }"
	name            = "${ var.environment }-${ var.project_name }-LB-sg"
	vpc_id          = "${ module.env_vpc.vpc_id }"
    project_name    = "${ var.project_name }"
}

module "env_sg" {
	source = "../../modules/sg"

    region          = "${ var.region }"
    cidr_ip         = "${ var.cidr_ip }"
	name            = "${ var.environment }-API${ var.project_name }-sg"
	vpc_id          = "${ module.env_vpc.vpc_id }"
    project_name    = "${ var.project_name }"
}

module "env_sg_rules_ssh" {
	source = "../../modules/sg_rules"

	cidr_ip       = "0.0.0.0/0"
	from_port     = "22"
	to_port       = "22"
	sg_id         = "${ module.env_sg.id }"
}

module "env_sg_rules_http" {
	source = "../../modules/sg_rules_sg"

	source_sg_id  = "${ module.env_lb_sg.id }"
    from_port     = "80"
    to_port       = "80"
	sg_id         = "${ module.env_sg.id }"
}
module "env_sg_rules_https" {
	source = "../../modules/sg_rules_sg"

	source_sg_id  = "${ module.env_lb_sg.id }"
    from_port     = "443"
    to_port       = "443"
	sg_id         = "${ module.env_sg.id }"
}

module "env_sg_rules_egress" {
	source = "../../modules/sg_rules"

	cidr_ip       = "0.0.0.0/0"
	from_port     = "0"
	to_port       = "0"
	protocol      = "-1"
	sg_id         = "${ module.env_sg.id }"
	sg_type       = "egress"
}
