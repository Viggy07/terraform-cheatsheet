data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.webserver_vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}-private-*"]
  }
}

data "aws_ami" "datasync_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["aws-datasync-*"]
  }
}

data "aws_vpc" "webserver" {
  tags = {
    Name = "webserver-vpc"
  }
}

locals {
  subnet_filters = {
    "tag:Name" = ["*private*"]
  }
}

data "aws_subnet_ids" "dr_subnet" {
  count  = var.deploy_dr ? 1 : 0
  vpc_id = data.aws_vpc.rds_dr[0].id
  dynamic "filter" {
    for_each = try(var.eks_deploy ? local.subnet_filters : tomap(false), {})
    content {
      name   = filter.key
      values = filter.value
    }
  }
  provider = aws.dr
}
