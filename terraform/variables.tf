variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "avzones" {
  default = "us-east-1"
}
variable "ami" {
  default = "ami-026b57f3c383c2eec"
}
variable "keyname" {
  default = "jenkins-aws"
}
variable "inst_type" {
  default = "t2.micro"
}
variable "db_inst_type" {
  default = "db.t3.micro"
}
variable "db_pass" {
  default = "Kr*MSJGjEI.$4SQ"
}
variable "db_user" {
  default = "jumia"
}
variable "db_name" {
  default = "jumia_phone_validator"
}
variable "private_network_cidr"{
  default = "subnet-094123d8a904f2c01"
}
variable "public_network_cidr"{
  default = "subnet-01424344084e43473"
}
