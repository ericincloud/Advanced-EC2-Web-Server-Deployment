provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Advanced-EC2-Web-Server-Deployment"
  }
}

resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet ${count.index}"
  }
}

resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.${count.index + 3}.0/24"
  tags = {
    Name = "Private Subnet ${count.index}"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-04479e961467114dd"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private[0].id
  tags = {
    Name = "Advanced-EC2-Web-Server-Deployment"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "advanced-ec2-web-server-deployment"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_security_group" "default" {
  name        = "Advanced-EC2-Web-Server-Deployment"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "test" {
  name               = "Adv-EC2-Web-Server"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.default.id]
  subnets            = [aws_subnet.public[0].id, aws_subnet.public[1].id]
}

resource "aws_instance" "public" {
  ami           = "ami-04479e961467114dd"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "Advanced-EC2-Web-Server-Deployment"
  }
}
