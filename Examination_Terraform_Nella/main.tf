module "web" {
  source           = "./modules"
  instance_type    = var.root_instance_type
  vpc_id           = var.root_vpc_id
  subnet_ids       = var.root_subnet_ids
  min_size         = var.root_min_size
  max_size         = var.root_max_size
  desired_capacity = var.root_desired_capacity
}
