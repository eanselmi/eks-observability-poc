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


eks-poc = {
  name                            = "ekspoc-cloudwatch-poc"
  version                         = "1.29"
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  create_cluster_security_group = false
  create_node_security_group    = false

  ######### Deprecated #########
  #manage_aws_auth_configmap     = true
  #aws_auth_roles                = []
  # aws_auth_users = [
  #   {
  #     userarn  = "arn:aws:iam::261450366272:user/nazareno"
  #     username = "nazaerno"
  #     groups   = ["system:masters"]
  #   }
  # ]
  ###############################

  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "*"
        }
      ]
    }
  }

  enable_cluster_creator_admin_permissions = true
  access_entries = {
    # One access entry with a policy associated
    example = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::123456789012:role/something"

      policy_associations = {
        example = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
      }
    }
  }

  eks_managed_node_groups = {
    eks-node-poc = {
      min_size     = 2
      max_size     = 6
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "ON_DEMAND"
    }
  }

  cluster_addons = {
    coredns = {
      most_recent = true
      #configuration_values = "{\"computeType\":\"Fargate\"}"
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
      # service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
      # before_compute           = true
      # most_recent              = true
      # configuration_values = jsonencode({
      #   env = {
      #     ENABLE_PREFIX_DELEGATION = "true"
      #     WARM_PREFIX_TARGET       = "1"
      #   }
      # })
    }
    amazon-cloudwatch-observability = {
      most_recent = true
    }
    eks-pod-identity-agent = {
      most_recent = true
    }
  }
}

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
