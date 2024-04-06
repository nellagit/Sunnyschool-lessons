
variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}
variable "instance_type" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}