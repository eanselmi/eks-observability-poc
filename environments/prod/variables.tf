variable "project_tags" {
  description = "tags del proyecto"
  type = object({
    env         = string
    owner       = string
    cloud       = string
    project     = string
    region      = string
    region-code = string
  })
}

variable "vpc" {
  description = "Valores de la VPC"
  type = object({
    cidr                     = string
    public_subnets           = map(map(string))
    private_subnets          = map(map(string))
    natgw_enable             = bool
    dns_support              = bool
    dns_hostnames            = bool
    s3_endpoint_enable       = bool
    dynamodb_endpoint_enable = bool
  })
}



########### EKS ###########

variable "eks-poc" {
  description = "Valores del EKS"
  type = object({
    name                            = string
    version                         = string
    cluster_endpoint_public_access  = bool
    cluster_endpoint_private_access = bool
    cluster_addons                  = map(map(any))
    create_cluster_security_group   = bool
    create_node_security_group      = bool
    #manage_aws_auth_configmap       = bool
    #aws_auth_roles                  = list(any)
    #aws_auth_users                  = list(any)
    enable_cluster_creator_admin_permissions = bool
    access_entries                           = any
    fargate_profiles                         = any
    eks_managed_node_groups                  = any
  })
}

variable "vpn_poc" {
  description = "Valores de la VPN poc"
  type = object({
    bgp_asn                           = number
    type                              = string
    create_vpn_gateway_attachment     = bool
    connect_to_transit_gateway        = bool
    vpn_connection_static_routes_only = bool
    cidrs                             = list(string)
    ip_address                        = string

    #TUNNEL 1
    tunnel1_ike_versions                 = list(string)
    tunnel1_phase1_dh_group_numbers      = list(string)
    tunnel1_phase1_encryption_algorithms = list(string)
    tunnel1_phase1_integrity_algorithms  = list(string)
    tunnel1_phase1_lifetime_seconds      = string
    tunnel1_phase2_dh_group_numbers      = list(string)
    tunnel1_phase2_encryption_algorithms = list(string)
    tunnel1_phase2_integrity_algorithms  = list(string)
    tunnel1_phase2_lifetime_seconds      = string
    tunnel1_preshared_key                = string

    #TUNNEL 2
    tunnel2_ike_versions                 = list(string)
    tunnel2_phase1_dh_group_numbers      = list(string)
    tunnel2_phase1_encryption_algorithms = list(string)
    tunnel2_phase1_integrity_algorithms  = list(string)
    tunnel2_phase1_lifetime_seconds      = string
    tunnel2_phase2_dh_group_numbers      = list(string)
    tunnel2_phase2_encryption_algorithms = list(string)
    tunnel2_phase2_integrity_algorithms  = list(string)
    tunnel2_phase2_lifetime_seconds      = string
    tunnel2_preshared_key                = string
    tunnel1_ike_versions                 = list(string)
    tunnel1_ike_versions                 = list(string)
    tunnel1_ike_versions                 = list(string)
    tunnel1_ike_versions                 = list(string)
    tunnel1_ike_versions                 = list(string)
  })
}
