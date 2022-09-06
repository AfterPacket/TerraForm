resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type =  var.instance_size
  key_name = var.key
  availability_zone       = var.zone_a

  network_interface {
    network_interface_id = aws_network_interface.multi-ip.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_vpc" "default" {
  cidr_block           = var.vpccidr
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
}

resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.default.id // Referencing the id of the VPC from above code block
  cidr_block              = var.publicsubnetcidr
  map_public_ip_on_launch = "true" // Makes this a public subnet
  availability_zone       =  var.zone_a
}


resource "aws_network_interface" "multi-ip" {

  subnet_id   = aws_subnet.prod-subnet-public-1.id
  private_ips = ["172.100.1.6", "172.100.1.8"]
  depends_on = [aws_internet_gateway.gw]
 
}

resource "aws_eip" "one" {

  instance                  = aws_instance.foo.id
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "172.100.1.6"
  depends_on                = [aws_internet_gateway.gw]
}
resource "aws_eip" "two" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "172.100.1.8"
}


resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_vpc" "nginx-vpc" {
  cidr_block           = var.vpccidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  instance_tenancy     = "default"
}


