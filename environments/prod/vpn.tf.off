resource "aws_customer_gateway" "poc" {
  bgp_asn    = var.vpn_poc.bgp_asn
  ip_address = var.vpn_poc.ip_address
  type       = var.vpn_poc.type
  tags = {
    Name = "poc-customer-gateway"
  }
}
module "vpn_poc" {
  source                            = "terraform-aws-modules/vpn-gateway/aws"
  version                           = "~> 3.0"
  create_vpn_gateway_attachment     = var.vpn_poc.create_vpn_gateway_attachment
  connect_to_transit_gateway        = var.vpn_poc.connect_to_transit_gateway
  vpc_id                            = module.vpc.vpc_id
  transit_gateway_id                = module.transit_gateway.transit_gateway_id
  customer_gateway_id               = aws_customer_gateway.poc.id
  vpn_connection_static_routes_only = var.vpn_poc.vpn_connection_static_routes_only
  vpc_subnet_route_table_ids        = module.vpc.private_subnets

  #TUNNEL 1
  tunnel1_ike_versions                 = var.vpn_poc.tunnel1_ike_versions
  tunnel1_phase1_dh_group_numbers      = var.vpn_poc.tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.vpn_poc.tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.vpn_poc.tunnel1_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = var.vpn_poc.tunnel1_phase1_lifetime_seconds
  tunnel1_phase2_dh_group_numbers      = var.vpn_poc.tunnel1_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = var.vpn_poc.tunnel1_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = var.vpn_poc.tunnel1_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = var.vpn_poc.tunnel1_phase2_lifetime_seconds
  tunnel1_preshared_key                = var.vpn_poc.tunnel1_preshared_key

  #TUNNEL 2
  tunnel2_ike_versions                 = var.vpn_poc.tunnel2_ike_versions
  tunnel2_phase1_dh_group_numbers      = var.vpn_poc.tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms = var.vpn_poc.tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms  = var.vpn_poc.tunnel2_phase1_integrity_algorithms
  tunnel2_phase1_lifetime_seconds      = var.vpn_poc.tunnel2_phase1_lifetime_seconds
  tunnel2_phase2_dh_group_numbers      = var.vpn_poc.tunnel2_phase2_dh_group_numbers
  tunnel2_phase2_encryption_algorithms = var.vpn_poc.tunnel2_phase2_encryption_algorithms
  tunnel2_phase2_integrity_algorithms  = var.vpn_poc.tunnel2_phase2_integrity_algorithms
  tunnel2_phase2_lifetime_seconds      = var.vpn_poc.tunnel2_phase2_lifetime_seconds
  tunnel2_preshared_key                = var.vpn_poc.tunnel2_preshared_key

  tags = {
    Name = "poc-s2s-vpn"
  }
}
resource "aws_ec2_transit_gateway_route_table_association" "vpn_poc" {
  transit_gateway_attachment_id  = module.vpn_poc.vpn_connection_transit_gateway_attachment_id
  transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id
}
resource "aws_ec2_transit_gateway_route" "vpn_poc" {
  for_each                       = toset(var.vpn_poc.cidrs)
  destination_cidr_block         = each.key
  transit_gateway_attachment_id  = module.vpn_poc.vpn_connection_transit_gateway_attachment_id
  transit_gateway_route_table_id = module.transit_gateway.transit_gateway_route_table_id
}

resource "aws_route" "poc_routes" {
  count                  = length(module.vpc.private_route_tables) * length(var.vpn_poc.cidrs)
  route_table_id         = element(module.vpc.private_route_tables, floor(count.index / length(var.vpn_poc.cidrs)))
  destination_cidr_block = element(var.vpn_poc.cidrs, count.index % length(var.vpn_poc.cidrs))
  transit_gateway_id     = module.transit_gateway.transit_gateway_id
}
