variable "root_vpc_id" {}
variable "root_subnet_ids" {
  type = list(string)
}
variable "root_instance_type" {}
variable "root_min_size" {}
variable "root_max_size" {}
variable "root_desired_capacity" {}