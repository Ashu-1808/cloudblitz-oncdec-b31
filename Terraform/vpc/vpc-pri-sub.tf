
# create vpc
resource "aws_vpc" "vnet" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "vpc-with-tf"
  }
}
# create public subnet,igw,rt

resource "aws_subnet" "pub" {
  vpc_id                  = aws_vpc.vnet.id
  cidr_block              = "192.168.0.0/23"
  availability_zone       = "ap-southeast-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vnet.id
  tags = {
    Name = "igw-vpc-with-tf"
  }
}

resource "aws_route_table" "rt-1" {
  vpc_id = aws_vpc.vnet.id
  tags = {
    Name = "RT-Public"
  }

  route {
    gateway_id = aws_internet_gateway.igw.id
    cidr_block = "0.0.0.0/0"
  }
}


resource "aws_route_table_association" "rta-1" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.rt-1.id
}

# create private subnet, nat, rt

resource "aws_subnet" "pri" {
  vpc_id                  = aws_vpc.vnet.id
  cidr_block              = "192.168.2.0/23"
  availability_zone       = "ap-southeast-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Private-Subnet"
  }

}

resource "aws_eip" "static" {
  domain = "vpc"

}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.static.id
  subnet_id     = aws_subnet.pub.id
  tags = {
    Name = "nat-vpc-with-tf"
  }
}

resource "aws_route_table" "rt-2" {
  vpc_id = aws_vpc.vnet.id
  tags = {
    Name = "RT-Private"
  }
  route {
    nat_gateway_id = aws_nat_gateway.nat.id
    cidr_block     = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "rta-2" {
  subnet_id      = aws_subnet.pri.id
  route_table_id = aws_route_table.rt-2.id
}


# create security group

resource "aws_security_group" "sg" {
  name   = "firewall-vpc-with-tf"
  vpc_id = aws_vpc.vnet.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# create ec2 instance
resource "aws_instance" "pub" {
  ami                    = "ami-05f071c65e32875a8"
  instance_type          = "t3.micro"
  key_name               = "pankaj"
  subnet_id              = aws_subnet.pub.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data              = <<-EOF
     #!/bin/bash
     sudo -i
     yum install httpd -y
     systemctl start httpd
     echo "Hello Terraform Happpy New Year" > /var/www/html/index.html
    EOF
  tags = {
    Name = "TF-Server-Public"
  }
}

resource "aws_instance" "pri" {
  ami                    = "ami-05f071c65e32875a8"
  instance_type          = "t3.micro"
  key_name               = "pankaj"
  subnet_id              = aws_subnet.pri.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "TF-Server-Private"
  }
}
