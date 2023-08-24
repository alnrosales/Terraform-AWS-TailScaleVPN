data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["125523088429"]
  #owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["Fedora-Cloud-Base-38-*.x86_64-hvm-us-west-1-gp3-0"]
    #values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}