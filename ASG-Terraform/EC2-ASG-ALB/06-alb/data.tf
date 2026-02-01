data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "supported" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = var.allowed_azs
  }
}
