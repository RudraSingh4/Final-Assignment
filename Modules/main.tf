# create  VPC
module "vpc" {
    source              = "../Vpc/Modules"
    vpc_cidr            = var.vpc_cidr
    subnet_cidr         = var.subnet_cidr
    route_cidr          = var.route_cidr
    security-group_cidr = var.security-group_cidr
    ami-id              = var.ami-id
  
}