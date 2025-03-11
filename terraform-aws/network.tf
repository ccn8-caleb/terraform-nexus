locals {
  subnets = flatten([for cidr_block in cidrsubnets(var.vpc_base_cidr, 8, 8, 8, 8) : cidrsubnets(cidr_block, 2, 2)])
}

resource "aws_vpc" "base" {
  cidr_block = var.vpc_base_cidr
  tags       = merge(var.tags, { Name = var.vpc_base_name })
}

resource "aws_subnet" "subnets" {
  count             = length(local.subnets)
  vpc_id            = aws_vpc.base.id
  cidr_block        = local.subnets[count.index]
  availability_zone = var.availability_zone_primary
  tags              = merge(var.tags, { Name = "${var.vpc_base_name}-subnet-${count.index}" })
}