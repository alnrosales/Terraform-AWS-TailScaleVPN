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
  default = "IyEvYmluL2Jhc2gKeXVtIHVwZGF0ZSAteQp5dW0gaW5zdGFsbCBhd3NjbGkgbmV0aG9ncyAteQpjdXJsIC1mc1NMIGh0dHBzOi8vdGFpbHNjYWxlLmNvbS9pbnN0YWxsLnNoIHwgc2gKZWNobyAnbmV0LmlwdjQuaXBfZm9yd2FyZCA9IDEnIHwgc3VkbyB0ZWUgLWEgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHN5c2N0bCAtcCAvZXRjL3N5c2N0bC5kLzk5LXRhaWxzY2FsZS5jb25mCnN1ZG8gdGFpbHNjYWxlIHVwIC0tYXV0aGtleT0kKGF3cyBzc20gZ2V0LXBhcmFtZXRlciAtLW5hbWUgVlBOMSAtLXdpdGgtZGVjcnlwdGlvbiAtLXF1ZXJ5ICJQYXJhbWV0ZXIuVmFsdWUiIC0tb3V0cHV0IHRleHQpIC0taG9zdG5hbWU9dXMtd2VzdC12cG4tMSAtLXNzaCAtLWFkdmVydGlzZS1leGl0LW5vZGUgLS1hY2NlcHQtcm91dGVz"
}
variable "userVPN2" {
  type    = string
  default = "IyEvYmluL2Jhc2gKeXVtIHVwZGF0ZSAteQp5dW0gaW5zdGFsbCBhd3NjbGkgbmV0aG9ncyAteQpjdXJsIC1mc1NMIGh0dHBzOi8vdGFpbHNjYWxlLmNvbS9pbnN0YWxsLnNoIHwgc2gKZWNobyAnbmV0LmlwdjQuaXBfZm9yd2FyZCA9IDEnIHwgc3VkbyB0ZWUgLWEgL2V0Yy9zeXNjdGwuZC85OS10YWlsc2NhbGUuY29uZgpzdWRvIHN5c2N0bCAtcCAvZXRjL3N5c2N0bC5kLzk5LXRhaWxzY2FsZS5jb25mCnN1ZG8gdGFpbHNjYWxlIHVwIC0tYXV0aGtleT0kKGF3cyBzc20gZ2V0LXBhcmFtZXRlciAtLW5hbWUgVlBOMiAtLXdpdGgtZGVjcnlwdGlvbiAtLXF1ZXJ5ICJQYXJhbWV0ZXIuVmFsdWUiIC0tb3V0cHV0IHRleHQpIC0taG9zdG5hbWU9dXMtd2VzdC12cG4tMiAtLXNzaCAtLWFkdmVydGlzZS1leGl0LW5vZGUgLS1hY2NlcHQtcm91dGVz"
}
variable "tskey1" {
  type    = string
  default = "tskey-auth-xxxx"
}
variable "tskey2" {
  type    = string
  default = "tskey-auth-xxxx"
}
# on the shell export TF_VAR_tskey*="tskey-auth-xxxx" 

variable "price" {
  type    = number
  default = 0.0045
}
