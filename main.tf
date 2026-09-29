# 1. Configure the Core Terraform Configuration Matrix Constraints
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

# 2. Define the Local Bank-Infrastructure Provisioning Resource Provider Target
resource "local_file" "aegis_infrastructure_manifest" {
  filename = "${path.module}/aegis-topology-manifest.txt"
  content  = <<EOT
====================================================================
           AEGIS FINANCIAL PLATFORM CORE TOPOLOGY MAP
====================================================================
[ENVIRONMENT] PRODUCTION ENVIRONMENT
[TARGET NODE] DEPLOYED DIRECTLY TO MINIKUBE DOCKER MESH GRID
[AVAILABILITY BALANCING] 2 MULTI-TENANT REPLICA POD ENGINE GROUPS
[METRICS HARVEST ENGINE] ACTIVE STATUS TRACKING VIA OPENLENS
====================================================================
EOT
}
