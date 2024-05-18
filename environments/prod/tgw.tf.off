module "transit_gateway" {
  source                      = "cloudposse/transit-gateway/aws"
  version                     = "0.11.0"
  ram_resource_share_enabled  = false
  config                      = local.transit_gateway_config
  transit_gateway_description = "Poc TGW"
  tags = {
    Name = "poc-tgw"
  }
}

locals {
  transit_gateway_config = {
    poc = {
      vpc_id                            = module.vpc.vpc_id
      vpc_cidr                          = var.vpc.cidr
      subnet_ids                        = module.vpc.private_subnets
      subnet_route_table_ids            = module.vpc.private_route_tables
      route_to                          = []
      route_to_cidr_blocks              = null
      transit_gateway_vpc_attachment_id = null
      static_routes                     = []
    }
  }
}
