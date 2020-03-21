
resource "aws_vpc" "env_vpc" {
  cidr_block = "${var.cidr_ip}"
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false
  instance_tenancy = "default"

  tags = {
  Name = "${ var.environment }-${ var.project_name }-VPC"
  } 
}

# Define the public subnet
resource "aws_subnet" "public-subnet" {

  count = "${length(var.public_subnet_cidr)}"
  vpc_id = "${aws_vpc.env_vpc.id}"
  cidr_block = "${var.public_subnet_cidr[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
  Name = "${ var.environment }-${ var.project_name }-Public-Subnet"
  }
}

# Define the private subnet
resource "aws_subnet" "private-subnet" {

  count = "${length(var.private_subnet_cidr)}"
  vpc_id = "${aws_vpc.env_vpc.id}"
  cidr_block = "${var.private_subnet_cidr[count.index]}"
  availability_zone = "${var.availability_zones[count.index]}"

  tags = {
  Name = "${ var.environment }-${ var.project_name }-Private-Subnet"
  }
}

# Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.env_vpc.id}"

  tags = {
  Name = "${ var.environment }-${ var.project_name }-IGW"
  }
}

# Define the route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = "${aws_vpc.env_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
  Name = "${ var.environment }-${ var.project_name }-RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {

  count = "${length(var.public_subnet_cidr)}"
  subnet_id = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.web-public-rt.id}"
}
