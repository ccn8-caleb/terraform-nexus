resource "aws_vpc" "main" {
    name = var.vpc_name
    cidr_block = "${var.vpc_cidr_prefix}"+"${var.vpc_cidr_bits}"
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = var.tag_map
}

