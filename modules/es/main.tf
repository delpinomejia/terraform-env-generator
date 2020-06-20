data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

resource "aws_elasticsearch_domain" "es" {
  domain_name = "${var.es_domain}"
  elasticsearch_version = "6.3"

  cluster_config {
      instance_type = "t2.small.elasticsearch"
  }

  vpc_options {
      subnet_ids = "${var.es_subnets}"
      security_group_ids = [
          "${aws_security_group.es_sg.id}"
      ]
  }

  ebs_options {
      ebs_enabled = true
      volume_size = 20
  }

  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": "es:*",
          "Principal": "*",
          "Effect": "Allow",
          "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.es_domain}/*"
      }
  ]
}
  CONFIG

  snapshot_options {
      automated_snapshot_start_hour = 23
  }

  tags {
      Domain = "${var.es_domain}"
  }
}

output "ElasticSearch Endpoint" {
  value = "${aws_elasticsearch_domain.es.endpoint}"
}

output "ElasticSearch Kibana Endpoint" {
  value = "${aws_elasticsearch_domain.es.kibana_endpoint}"
}
