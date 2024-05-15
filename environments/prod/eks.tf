################################################################################
# EKS Module
################################################################################


module "eks-poc" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "20.8.5"
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets
  cluster_name                    = var.eks-poc.name
  cluster_version                 = var.eks-poc.version
  cluster_endpoint_public_access  = var.eks-poc.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.eks-poc.cluster_endpoint_private_access
  cluster_addons                  = var.eks-poc.cluster_addons
  create_cluster_security_group   = var.eks-poc.create_cluster_security_group
  create_node_security_group      = var.eks-poc.create_node_security_group
  ########## Deprecated #############
  # manage_aws_auth_configmap       = var.eks-poc.manage_aws_auth_configmap
  # aws_auth_roles                  = var.eks-poc.aws_auth_roles
  # aws_auth_users                  = var.eks-poc.aws_auth_users
  ###################################
  enable_cluster_creator_admin_permissions = var.eks-poc.enable_cluster_creator_admin_permissions

  ########## Use Fargate and/or Managed node groups #############
  #fargate_profiles                = var.eks-poc.fargate_profiles
  eks_managed_node_groups = var.eks-poc.eks_managed_node_groups

  create = true
  tags = {
    env = "poc"
  }
}

resource "aws_iam_role_policy_attachment" "eks_cluster_profile" {
  role       = module.eks-poc.cluster_iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_log_full_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_cluster_cloudwatch_agent" {
  role       = module.eks-poc.cluster_iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_agent_server_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_node_profile" {
  role       = module.eks-poc.eks_managed_node_groups.eks-node-poc.iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_log_full_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_node_cloudwatch_agent" {
  role       = module.eks-poc.eks_managed_node_groups.eks-node-poc.iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_agent_server_policy.arn
}

resource "aws_iam_role_policy_attachment" "eks_node_awsxray_policy" {
  role       = module.eks-poc.eks_managed_node_groups.eks-node-poc.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
}


################################################################################


################################################################################
# Blueprints para Load Balancer
################################################################################


module "eks_blueprints_addons_prod" {
  source            = "aws-ia/eks-blueprints-addons/aws"
  version           = "1.12.0"
  depends_on        = [module.eks-poc]
  cluster_name      = module.eks-poc.cluster_name
  cluster_endpoint  = module.eks-poc.cluster_endpoint
  cluster_version   = module.eks-poc.cluster_version
  oidc_provider_arn = module.eks-poc.oidc_provider_arn

  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    set = [
      {
        name  = "vpcId"
        value = module.vpc.vpc_id
      }
    ]
  }
  tags = {
    env = "poc"
  }
}

resource "aws_ec2_tag" "tag_public_subnets" {
  depends_on  = [module.vpc]
  count       = length(module.vpc.public_subnets)
  resource_id = module.vpc.public_subnets[count.index]
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "tag_private_subnets" {
  depends_on  = [module.vpc]
  count       = length(module.vpc.private_subnets)
  resource_id = module.vpc.private_subnets[count.index]
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

################################################################################


################################################################################
# Service account for EKS
################################################################################

# module "kubernetes_iamserviceaccount_pocsa" {
#   source  = "bigdatabr/kubernetes-iamserviceaccount/aws"
#   version = "1.1.0"


#   service_account_name = "pocsa"

#   cluster_name = module.eks-poc.cluster_name
#   namespace    = "default"
#   role_name    = "pocrol"

#   depends_on = [module.eks-poc]
# }

# resource "aws_iam_role_policy_attachment" "agent_poc_sa" {
#   role       = module.kubernetes_iamserviceaccount_pocsa.iam_role.name
#   policy_arn = data.aws_iam_policy.cloudwatch_agent_server_policy.arn
# }

# resource "aws_iam_role_policy_attachment" "log_poc_sa" {
#   role       = module.kubernetes_iamserviceaccount_pocsa.iam_role.name
#   policy_arn = data.aws_iam_policy.cloudwatch_log_full_policy.arn
# }


resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  # create_namespace = true
  # namespace        = "monitoring"
  depends_on = [module.eks-poc]
}

# resource "helm_release" "grafana" {
#   name       = "grafana"
#   repository = "https://grafana.github.io/helm-charts"
#   chart      = "grafana"
#   namespace  = "monitoring"
#   depends_on = [module.eks-poc, helm_release.prometheus]
# }
