terraform {
  backend "s3" {
    bucket         = "boot4-tf-state-ncpl-nisarg"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "boot4-terraform-lock-table"
    encrypt        = true
  }
}
