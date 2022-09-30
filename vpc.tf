//vpc
resource "aws_vpc" "q2-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = ${project_name}+"vpc"
  }
}

//internet gateway
resource "aws_internet_gateway" "q2-gw" {
  vpc_id = aws_vpc.q2-vpc.id
  tags = {
    "Name" = ${project_name}+"gw"
  }
}

//public sub1
resource "aws_subnet" "public-subnet1" {
    vpc_id = aws_vpc.q2-vpc.id
    cidr_block = "10.0.10.0/24"
    tags = {
      "Name" = "pub_subnet1"
    }
    availability_zone = ${var.availability _zone_a}
    map_public_ip_on_launch = true  
}

//public sub2
resource "aws_subnet" "public-subnet2" {
    vpc_id = aws_vpc.q2-vpc.id
    cidr_block = "10.0.20.0/24"
    tags = {
      "Name" = "pub_subnet2"
    }
    availability_zone = ${var.availability _zone_b}
    map_public_ip_on_launch = true   
}

//privet subnet1
resource "aws_subnet" "privet-subnet1" {
  vpc_id = aws_vpc.q2-vpc.id
  cidr_block = "10.0.100.0/24"
  tags = {
    "Name" = "privet_subnet1"
  }
  availability_zone = ${var.availability _zone_a}
  map_public_ip_on_launch = false
}

//privet subnet2
resource "aws_subnet" "privet-subnet2" {
    vpc_id = aws_vpc.q2-vpc.id
    cidr_block = "10.0.200.0/24"
    tags = {
      "Name" = "privet_subnet2"
    }
    availability_zone = ${var.availability _zone_b}
    map_public_ip_on_launch = false
}
