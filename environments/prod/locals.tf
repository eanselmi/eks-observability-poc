locals {
  sufix = "${var.project_tags.project}-${var.project_tags.env}-${var.project_tags.region}"
}

locals {
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
        min_size     = 3
        max_size     = 6
        desired_size = 3

        instance_types = ["m5.large"]
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
      # aws-ebs-csi-driver = {
      #   service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
      #   most_recent              = true
      # }
      # aws-efs-csi-driver = {
      #   most_recent = true
      # }
    }
  }
}
