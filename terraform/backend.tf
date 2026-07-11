# S3 Backend Configuration (Remote State)
#
# INSTRUCTIONS:
# 1. First run: terraform init (without uncommenting the backend block below)
# 2. Deploy resources: terraform apply
# 3. Create an S3 bucket manually for Terraform state (or use the generated bucket)
# 4. Uncomment the terraform backend block below
# 5. Run: terraform init -migrate-state (to migrate local state to S3)
#
# This setup allows multiple team members to share the same Terraform state.

# terraform {
#   backend "s3" {
#     bucket         = "YOUR_TERRAFORM_STATE_BUCKET"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
