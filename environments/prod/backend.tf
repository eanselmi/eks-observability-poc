terraform {
  required_version = ">= 1.0.0"

  # backend "s3" {
  #   region         = "us-east-1"
  #   bucket         = "virginia-prod-ekspoc-state"
  #   key            = "terraform.tfstate"
  #   dynamodb_table = "virginia-prod-ekspoc-state-lock"
  #   encrypt        = "true"
  # }
}
