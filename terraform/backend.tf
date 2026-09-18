terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "coreaegis-global-infrastructure-state-prod"
    key            = "finance-core/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "coreaegis-infrastructure-state-locks"
  }
}

provider "aws" {
  region = "us-east-1"
  
  default_tags {
    tags = {
      Environment = "Production"
      Project     = "CoreAegis-FinTech"
      ManagedBy   = "Terraform-IaC"
      Engineer    = "Adetunji-Mathew"
    }
  }
}
