# 🔐 AWS KMS Customer Master Key (CMK) for Infrastructure Encryption
resource "aws_kms_key" "aegis_encryption_key" {
  description             = "Master Encryption Key for Core Banking Database Credentials"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform-IaC"
    Security    = "Strict-Compliance"
  }
}

# 📦 Decoupled Production Database Password Stored Securely in SSM Parameter Store
resource "aws_ssm_parameter" "db_password" {
  name        = "/production/finance-core/db_password"
  description = "Encrypted runtime database credential for the core financial application API"
  type        = "SecureString"
  value       = "VaultBypassAlpha2026MasterKey!" 
  key_id      = aws_kms_key.aegis_encryption_key.arn

  tags = {
    Tier = "Backend-Database"
  }
}
