variable "name_prefix" {
  type = string
  default = "terraform-lc-example-"
}
variable "image_id" {
  type = string
  default = "ami-0629230e074c580f2"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "name" {
  type = string
  default = "terraform-asg-example"
}
variable "availability_zones" {
  type = list(string)
  default = ["us-east-2c"]
}
variable "name_lb" {
  type = string
  default = "test-lb-tf"
}
variable "load_balancer_type" {
  type = string
  default = "application"
}
variable "security_groups" {
  type = list(string)
  default = ["sg-017c097bb1674f881"]
}
variable "subnets" {
  type = list(string)
  default =  ["subnet-0ad08acb398ada09d","subnet-0a22ca2d020ca46c1"]
}
variable "name_TG" {
  type = string
  default = "tf-example-lb-tg"
}
variable "protocol" {
  type = string
  default = "HTTP"
}
variable "vpc_id" {
  type = string
  default = "vpc-048331c397b1a9bc3"
}
variable "target_id" {
  type = string
  default = "i-033e9c4279b6714ba"
}
