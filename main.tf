module "network" {
  source = "./network"

  app_name = var.app_name
}

module "instance" {
  source = "./instance"
  count  = 1

  app_name       = var.app_name
  instance_name  = "${var.app_name}-${count.index + 1}"
  subnet         = module.network.private_subnets[count.index % length(module.network.private_subnets)]
  security_group = module.network.security_group
  dd_api_key     = var.datadog_api_key
}

module "load_balancer" {
  source = "./load_balancer"

  app_name        = var.app_name
  vpc             = module.network.vpc
  instances       = module.instance.*.instance_id
  subnets         = module.network.public_subnets
  security_groups = [module.network.security_group]
}

module "monitoring_dashboard" {
  source = "./monitoring"

  app_name = var.app_name
}

module "repository" {
  source = "./repository"

  app_name          = var.app_name
  github_token      = var.github_token
  cloudify_host     = var.cloudify_host
  cloudify_user     = var.cloudify_user
  cloudify_password = var.cloudify_password
}
