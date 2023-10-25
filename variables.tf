#SSH Public Key
variable "key_code" {
  type    = string
  default = "tails_xxx"
}
variable "instance_type" {
  type    = string
  default = "t3a.micro"
}
variable "instance_profile" {
  type    = string
  default = "AmazonEC2RolesforSSM"
}
variable "userVPN1" {
  type    = string
  default = "IyEvYmluL2Jhc2gKZG5mIHVwZGF0ZSAteQpkbmYgaW5zdGFsbCBhd3NjbGkgLXkKY3VybCAtZnNTTCBodHRwczovL3RhaWxzY2FsZS5jb20vaW5zdGFsbC5zaCB8IHNoCmVjaG8gJ25ldC5pcHY0LmlwX2ZvcndhcmQgPSAxJyB8IHN1ZG8gdGVlIC1hIC9ldGMvc3lzY3RsLmQvOTktdGFpbHNjYWxlLmNvbmYKc3VkbyBzeXNjdGwgLXAgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHRhaWxzY2FsZSB1cCAtLWF1dGhrZXk9JChhd3Mgc3NtIGdldC1wYXJhbWV0ZXIgLS1uYW1lIFZQTjEgLS13aXRoLWRlY3J5cHRpb24gLS1xdWVyeSAiUGFyYW1ldGVyLlZhbHVlIiAtLW91dHB1dCB0ZXh0KSAtLWhvc3RuYW1lPXVzLXdlc3QtdnBuLTEgLS1zc2ggLS1hZHZlcnRpc2UtZXhpdC1ub2RlIC0tYWNjZXB0LXJvdXRlcw=="
}
variable "userVPN2" {
  type    = string
  default = "IyEvYmluL2Jhc2gKZG5mIHVwZGF0ZSAteQpkbmYgaW5zdGFsbCBhd3NjbGkgLXkKY3VybCAtZnNTTCBodHRwczovL3RhaWxzY2FsZS5jb20vaW5zdGFsbC5zaCB8IHNoCmVjaG8gJ25ldC5pcHY0LmlwX2ZvcndhcmQgPSAxJyB8IHN1ZG8gdGVlIC1hIC9ldGMvc3lzY3RsLmQvOTktdGFpbHNjYWxlLmNvbmYKc3VkbyBzeXNjdGwgLXAgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHRhaWxzY2FsZSB1cCAtLWF1dGhrZXk9JChhd3Mgc3NtIGdldC1wYXJhbWV0ZXIgLS1uYW1lIFZQTjIgLS13aXRoLWRlY3J5cHRpb24gLS1xdWVyeSAiUGFyYW1ldGVyLlZhbHVlIiAtLW91dHB1dCB0ZXh0KSAtLWhvc3RuYW1lPXVzLXdlc3QtdnBuLTIgLS1zc2ggLS1hZHZlcnRpc2UtZXhpdC1ub2RlIC0tYWNjZXB0LXJvdXRlcw=="
}
variable "tskey1" {
  type    = string
  default = "tskey-auth-xxx"
}
variable "tskey2" {
  type    = string
  default = "tskey-auth-xxx"
}
variable "price" {
  type    = number
  default = 0.0039
}
