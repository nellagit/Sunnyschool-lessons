variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}
variable "ami_parameter_name" {
  description = "SSM parameter name for the AMI"
  default     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
variable "name_prefix" {}
variable "device_name" {}
variable "volume_size" {}
variable "availability_zone" {}
variable "subnet_id" {}
variable "security_group_id" {}
variable "environment" {
  type    = string
  default = "dev"
}