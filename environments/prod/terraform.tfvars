########### VPC ###########

vpc = {
  "cidr" = "10.110.0.0/16"
  "public_subnets" = {
    public_subnet_a = {
      az   = "us-east-1a"
      cidr = "10.110.0.0/24"
    }
    public_subnet_b = {
      az   = "us-east-1b"
      cidr = "10.110.1.0/24"
    }
    public_subnet_c = {
      az   = "us-east-1c"
      cidr = "10.110.2.0/24"
    }
  }
  "private_subnets" = {
    private_subnet_a = {
      az   = "us-east-1a"
      cidr = "10.110.20.0/24"
    }
    private_subnet_b = {
      az   = "us-east-1b"
      cidr = "10.110.21.0/24"
    }
    private_subnet_c = {
      az   = "us-east-1c"
      cidr = "10.110.22.0/24"
    }
  }
  "natgw_enable"             = true
  "dns_support"              = true
  "dns_hostnames"            = true
  "s3_endpoint_enable"       = true
  "dynamodb_endpoint_enable" = true
}



########### TAGS ###########

project_tags = {
  "env"         = "poc"
  "owner"       = "owner"
  "cloud"       = "AWS"
  "project"     = "observability"
  "region"      = "virginia"
  "region-code" = "us-east-1"
}



########### EKS ###########




vpn_poc = {
  create_vpn_gateway_attachment     = false
  connect_to_transit_gateway        = true
  vpn_connection_static_routes_only = true
  cidrs                             = ["192.168.100.0/24"]
  ip_address                        = "201.252.144.108"
  bgp_asn                           = 65000
  type                              = "ipsec.1"

  #TUNNEL 1
  tunnel1_ike_versions                 = ["ikev1"]
  tunnel1_phase1_dh_group_numbers      = ["14"]
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase1_lifetime_seconds      = "28800"
  tunnel1_phase2_dh_group_numbers      = ["14"]
  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel1_phase2_lifetime_seconds      = "3600"
  tunnel1_preshared_key                = "ove1kjlYFYKMTJrin71O"

  #TUNNEL 2
  tunnel2_ike_versions                 = ["ikev1"]
  tunnel2_phase1_dh_group_numbers      = ["14"]
  tunnel2_phase1_encryption_algorithms = ["AES256"]
  tunnel2_phase1_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase1_lifetime_seconds      = "28800"
  tunnel2_phase2_dh_group_numbers      = ["14"]
  tunnel2_phase2_encryption_algorithms = ["AES256"]
  tunnel2_phase2_integrity_algorithms  = ["SHA2-256"]
  tunnel2_phase2_lifetime_seconds      = "3600"
  tunnel2_preshared_key                = "ove1kjlYFYKMTJrin71O"

}
