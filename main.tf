/*
    This Terraform configuration file sets up the backend configuration for managing the state of the AWS infrastructure.

    It uses the AWS S3 backend to store the Terraform state file and the DynamoDB table for state locking.

    The required version of Terraform is set to "~> 1.8.5" and the required version of the AWS provider is set to "~> 5.55.0", which are the latest versions at the time of writing. Please update these versions as needed.

    The AWS provider is configured to use the "ap-southeast-2" region.
*/

terraform {
  required_version = "~> 1.8.5" # Update the required version of Terraform

  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55.0" # Update the required version of the AWS provider
    }
  }
}

provider "aws" {
  region = "ap-southeast-2" # Update the AWS region. This should match the region defined in the tfbackend files.
}