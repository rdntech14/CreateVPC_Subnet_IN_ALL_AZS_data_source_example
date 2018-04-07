output "vpc_id" {
  value = "${aws_vpc.vpc_trf.id}"
}

output "subnets_ids" {
  value = "${aws_subnet.subnets.*.id}"
}

output "subnets_cidr_blocks" {
  value = "${aws_subnet.subnets.*.cidr_block}"
}

output "subnet_0_id" {
  value = "${aws_subnet.subnets.0.id}"
}
