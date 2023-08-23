resource "aws_vpc" "tf_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Name = "TailscaleLab"
  }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "tf_igw"
  }
}

resource "aws_route_table" "tf_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "tf_route_table"
  }
}

resource "aws_subnet" "tf_subnet-1" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "tf_pubsub-1"
  }
}

resource "aws_subnet" "tf_subnet-2" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = "10.0.128.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1b"

  tags = {
    Name = "tf_pubsub-2"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.tf_subnet-1.id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.tf_subnet-2.id
  route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.tf_vpc.id

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vpn_access" {
  name   = "shared-vpn-access"
  vpc_id = aws_vpc.tf_vpc.id
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "spot_launch_config" {
  name_prefix   = "spot-launch-config-"
  image_id      = "ami-xxx"
  instance_type = "t3a.micro"
  spot_price    = "0.0035"

}

resource "aws_autoscaling_group" "spot_asg" {
  name                 = "spot-asg"
  availability_zones   = ["us-west-1a"]
  max_size             = 2
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.spot_launch_config.name

  tag {
    key                 = "unsa"
    value               = "mani"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}

resource "aws_launch_configuration" "spot_launch_config2" {
  name_prefix   = "spot-launch-config2"
  image_id      = "ami-xxx"
  instance_type = "t3a.micro"
  spot_price    = "0.0035"

}

resource "aws_autoscaling_group" "spot_asg2" {
  name                 = "spot-asg2"
  availability_zones   = ["us-west-1b"]
  max_size             = 2
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.spot_launch_config2.name

  tag {
    key                 = "unsa"
    value               = "mani"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}
