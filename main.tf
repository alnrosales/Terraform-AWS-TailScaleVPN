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

resource "aws_launch_template" "vpn1" {
  name                                 = "vpn1"
  image_id                             = data.aws_ami.server_ami.id
  instance_type                        = "t3a.micro"
  instance_initiated_shutdown_behavior = "terminate"
  key_name                             = "tails"

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = "0.0036"
      spot_instance_type = "one-time"
    }
  }

  placement {
    availability_zone = "us-west-1a"
  }

  user_data = <<-EOF
    IyEvYmluL2Jhc2gKZG5mIHVwZGF0ZSAteQpjdXJsIC1mc1NMIGh0dHBzOi8vdGFpbHNjYWxlLmNvbS9pbnN0YWxsLnNoIHwgc2gKZWNobyAnbmV0LmlwdjQuaXBfZm9yd2FyZCA9IDEnIHwgc3VkbyB0ZWUgLWEgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHN5c2N0bCAtcCAvZXRjL3N5c2N0bC5kLzk5LXRhaWxzY2FsZS5jb25mCnN1ZG8gdGFpbHNjYWxlIHVwIC0tYXV0aGtleT10c2tleS1hdXRoLWtqSnRFVjNDTlRSTC1EeUp5enB3MkpmZ3NGU2VlbWVDM2Znb0pqdnhLRVllZiAtLWhvc3RuYW1lPXVzLXdlc3QtdnBuLTEgLS1zc2ggLS1hZHZlcnRpc2UtZXhpdC1ub2RlIC0tYWNjZXB0LXJvdXRlcw==
    EOF

}

resource "aws_autoscaling_group" "vpn1" {
  name               = "vpn1"
  availability_zones = ["us-west-1a"]
  max_size           = 2
  min_size           = 1
  desired_capacity   = 1

  launch_template {
    id      = aws_launch_template.vpn1.id
    version = "$Latest"
  }

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

resource "aws_launch_template" "vpn2" {
  name                                 = "vpn2"
  image_id                             = data.aws_ami.server_ami.id
  instance_type                        = "t3a.micro"
  instance_initiated_shutdown_behavior = "terminate"
  key_name                             = "tails"

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price          = "0.0036"
      spot_instance_type = "one-time"
    }
  }

  placement {
    availability_zone = "us-west-1b"
  }

  user_data = <<-EOF
    IyEvYmluL2Jhc2gKZG5mIHVwZGF0ZSAteQpjdXJsIC1mc1NMIGh0dHBzOi8vdGFpbHNjYWxlLmNvbS9pbnN0YWxsLnNoIHwgc2gKZWNobyAnbmV0LmlwdjQuaXBfZm9yd2FyZCA9IDEnIHwgc3VkbyB0ZWUgLWEgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHN5c2N0bCAtcCAvZXRjL3N5c2N0bC5kLzk5LXRhaWxzY2FsZS5jb25mCnN1ZG8gdGFpbHNjYWxlIHVwIC0tYXV0aGtleT10c2tleS1hdXRoLWtMdXgzSjdDTlRSTC1Uc3J1M1FTaUhiVEt6RThMdUdIdmFUNTRCZHM3WUdub1kgLS1ob3N0bmFtZT11cy13ZXN0LXZwbi0yIC0tc3NoIC0tYWR2ZXJ0aXNlLWV4aXQtbm9kZSAtLWFjY2VwdC1yb3V0ZXM=
    EOF

}

resource "aws_autoscaling_group" "vpn2" {
  name               = "vpn2"
  availability_zones = ["us-west-1b"]
  max_size           = 2
  min_size           = 1
  desired_capacity   = 1

  launch_template {
    id      = aws_launch_template.vpn2.id
    version = "$Latest"
  }

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