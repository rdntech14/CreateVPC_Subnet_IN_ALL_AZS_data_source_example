provider "aws" {
  region = "${var.AWS_REGION}"
}

resource "aws_vpc" "vpc_trf" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "vpc_trf"
  }
}

resource "aws_subnet" "subnets" {
  count = "${length(data.aws_availability_zones.azs.names)}"

  vpc_id            = "${aws_vpc.vpc_trf.id}"
  availability_zone = "${element(data.aws_availability_zones.azs.names, count.index)}"
  cidr_block        = "${element(var.subnets_cidr, count.index)}"

  tags {
    Name = "subnet_${count.index}"
  }
}
