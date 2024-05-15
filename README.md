# Ceibustech

Infra del proyecto Ceibus - USO INTERNO

## Diagrama de infraestructura final

Sobre este diagrama iremos construyendo la infraestructura

![image](./images/ceibus.jpg)

## Como usar....

1. Posicionarse en el directorio environments/prod
2. Desde aqui ejecutar los comandos de terraform

## Costo estimado de la infraestructura - actualizado al 20-12-2023

```
Name                                                                                             Monthly Qty  Unit                        Monthly Cost

 aws_cloudwatch_log_group.vpn_deyel_tunnel_1
 ├─ Data ingested                                                                         Monthly cost depends on usage: $0.50 per GB
 ├─ Archival Storage                                                                      Monthly cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned                                                         Monthly cost depends on usage: $0.005 per GB

 aws_cloudwatch_log_group.vpn_deyel_tunnel_2
 ├─ Data ingested                                                                         Monthly cost depends on usage: $0.50 per GB
 ├─ Archival Storage                                                                      Monthly cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned                                                         Monthly cost depends on usage: $0.005 per GB

 aws_ecr_repository.corresponsalias
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.corresponsalias-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.int-qr-bind-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.int-qr-link-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.int-sube-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.int-xnet-afip-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.nssa
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.nssa-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.prismapmc-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.siris
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.siris-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.trasa
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_ecr_repository.trasa-dev
 └─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB

 aws_instance.ad
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)                                                     730  hours                             $30.37
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  80  GB                                 $6.40

 aws_instance.docker
 ├─ Instance usage (Linux/UNIX, on-demand, t2.micro)                                                      730  hours                              $8.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.front_webpos_exclusivos
 ├─ Instance usage (Linux/UNIX, on-demand, m5.large)                                                      730  hours                             $70.08
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  50  GB                                 $4.00

 aws_instance.front_webpos_tradicional
 ├─ Instance usage (Linux/UNIX, on-demand, m5.large)                                                      730  hours                             $70.08
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  50  GB                                 $4.00

 aws_instance.menuweb01
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)                                                     730  hours                             $30.37
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.mikrotik
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)                                                     730  hours                             $30.37
 └─ root_block_device
    ├─ Storage (magnetic)                                                                                   1  GB                                 $0.05
    └─ I/O requests                                                                       Monthly cost depends on usage: $0.05 per 1M request

 aws_instance.ncc01
 ├─ Instance usage (Linux/UNIX, on-demand, r6i.xlarge)                                                    730  hours                            $183.96
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.prontopos01
 ├─ Instance usage (Linux/UNIX, on-demand, t2.micro)                                                      730  hours                              $8.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.sftp
 ├─ Instance usage (Linux/UNIX, on-demand, t3.medium)                                                     730  hours                             $30.37
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.sio01
 ├─ Instance usage (Linux/UNIX, on-demand, r6i.large)                                                     730  hours                             $91.98
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.tango
 ├─ Instance usage (Linux/UNIX, on-demand, c6i.large)                                                     730  hours                             $62.05
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.vdi["vdi-1"]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.xlarge)                                                     730  hours                            $121.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  80  GB                                 $6.40

 aws_instance.vdi["vdi-2"]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.xlarge)                                                     730  hours                            $121.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  80  GB                                 $6.40

 aws_instance.vdi["vdi-3"]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.xlarge)                                                     730  hours                            $121.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  80  GB                                 $6.40

 aws_instance.vdi["vdi-4"]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.xlarge)                                                     730  hours                            $121.47
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp3)                                                                  80  GB                                 $6.40

 aws_instance.webinst
 ├─ Instance usage (Linux/UNIX, on-demand, t2.small)                                                      730  hours                             $16.79
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_instance.zabbix
 ├─ Instance usage (Linux/UNIX, on-demand, t2.small)                                                      730  hours                             $16.79
 ├─ EC2 detailed monitoring                                                                                 7  metrics                            $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                                                                   8  GB                                 $0.80

 aws_rds_cluster.aurora_ekstest_prod
 ├─ Storage                                                                               Monthly cost depends on usage: $0.10 per GB
 ├─ I/O requests                                                                          Monthly cost depends on usage: $0.20 per 1M requests
 ├─ Backtrack                                                                             Monthly cost depends on usage: $0.012 per 1M change-records
 └─ Snapshot export                                                                       Monthly cost depends on usage: $0.01 per GB

 module.alb.aws_lb.this[0]
 ├─ Application load balancer                                                                             730  hours                             $16.43
 └─ Load balancer capacity units                                                          Monthly cost depends on usage: $5.84 per LCU

 module.eks-production.aws_cloudwatch_log_group.this[0]
 ├─ Data ingested                                                                         Monthly cost depends on usage: $0.50 per GB
 ├─ Archival Storage                                                                      Monthly cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned                                                         Monthly cost depends on usage: $0.005 per GB

 module.eks-production.aws_eks_cluster.this[0]
 └─ EKS cluster                                                                                           730  hours                             $73.00

 module.eks-production.module.fargate_profile["default"].aws_eks_fargate_profile.this[0]
 ├─ Per GB per hour                                                                                         1  GB                                 $3.24
 └─ Per vCPU per hour                                                                                       1  CPU                               $29.55

 module.eks-production.module.kms.aws_kms_key.this[0]
 ├─ Customer master key                                                                                     1  months                             $1.00
 ├─ Requests                                                                              Monthly cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                                                      Monthly cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                                                      Monthly cost depends on usage: $0.10 per 10k requests

 module.eks-staging.aws_cloudwatch_log_group.this[0]
 ├─ Data ingested                                                                         Monthly cost depends on usage: $0.50 per GB
 ├─ Archival Storage                                                                      Monthly cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned                                                         Monthly cost depends on usage: $0.005 per GB

 module.eks-staging.aws_eks_cluster.this[0]
 └─ EKS cluster                                                                                           730  hours                             $73.00

 module.eks-staging.module.fargate_profile["default"].aws_eks_fargate_profile.this[0]
 ├─ Per GB per hour                                                                                         1  GB                                 $3.24
 └─ Per vCPU per hour                                                                                       1  CPU                               $29.55

 module.eks-staging.module.kms.aws_kms_key.this[0]
 ├─ Customer master key                                                                                     1  months                             $1.00
 ├─ Requests                                                                              Monthly cost depends on usage: $0.03 per 10k requests
 ├─ ECC GenerateDataKeyPair requests                                                      Monthly cost depends on usage: $0.10 per 10k requests
 └─ RSA GenerateDataKeyPair requests                                                      Monthly cost depends on usage: $0.10 per 10k requests

 module.terraform_state_backend.aws_dynamodb_table.with_server_side_encryption[0]
 ├─ Write request unit (WRU)                                                              Monthly cost depends on usage: $0.00000125 per WRUs
 ├─ Read request unit (RRU)                                                               Monthly cost depends on usage: $0.00000025 per RRUs
 ├─ Data storage                                                                          Monthly cost depends on usage: $0.25 per GB
 ├─ Point-In-Time Recovery (PITR) backup storage                                          Monthly cost depends on usage: $0.20 per GB
 ├─ On-demand backup storage                                                              Monthly cost depends on usage: $0.10 per GB
 ├─ Table data restored                                                                   Monthly cost depends on usage: $0.15 per GB
 └─ Streams read request unit (sRRU)                                                      Monthly cost depends on usage: $0.0000002 per sRRUs

 module.terraform_state_backend.aws_s3_bucket.default[0]
 └─ Standard
    ├─ Storage                                                                            Monthly cost depends on usage: $0.023 per GB
    ├─ PUT, COPY, POST, LIST requests                                                     Monthly cost depends on usage: $0.005 per 1k requests
    ├─ GET, SELECT, and all other requests                                                Monthly cost depends on usage: $0.0004 per 1k requests
    ├─ Select data scanned                                                                Monthly cost depends on usage: $0.002 per GB
    └─ Select data returned                                                               Monthly cost depends on usage: $0.0007 per GB

 module.transit_gateway.aws_ec2_transit_gateway_vpc_attachment.default["old_vpc"]
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.transit_gateway.aws_ec2_transit_gateway_vpc_attachment.default["prod"]
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpc.aws_nat_gateway.nat_gateway[0]
 ├─ NAT gateway                                                                                           730  hours                             $32.85
 └─ Data processed                                                                        Monthly cost depends on usage: $0.045 per GB

 module.vpn_bica.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_camuzzi.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_deyel.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_edes.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_onprem.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_seac-backup.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_seac.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_sky.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_telecom.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_western-union-backup.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_western-union-main.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_xnet-backup.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_xnet.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 module.vpn_yopit.aws_vpn_connection.preshared[0]
 ├─ VPN connection                                                                                        730  hours                             $36.50
 ├─ Transit gateway attachment                                                                            730  hours                             $36.50
 └─ Data processed                                                                        Monthly cost depends on usage: $0.02 per GB

 OVERALL TOTAL                                                                                                                                $2,574.74
```
