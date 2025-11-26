module "aws-app" {
    source = "../../modules"
    environment = var.environment
    vpc_cidr = var.vpc_cidr
    public_subnet_cidr = var.public_subnet_cidr
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
}