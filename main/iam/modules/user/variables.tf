variable "aws_username" {}
variable "aws_resources" {
  type = list(any)
}
variable "aws_keybase_userid" {
  default = ""
}
variable "aws_pgp_key" {
  default = ""
}
