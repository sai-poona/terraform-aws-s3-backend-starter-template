# Terraform AWS S3 Backend Starter Template

> Note: This solution assumes that you are familiar with AWS.

This is a starter template to use Terraform with a S3 backend. This template can be used to launch AWS resources into different logical deployment environments (within the same AWS account or to different AWS accounts).

You would need appropriate IAM permissions to deploy resources into your AWS account.

## Prerequisites

To use this solution, a S3 bucket and a DynamoDB table should exist in your AWS account.

> Note: The DynamoDB table must be created with a partition key name `LockID` and type `String`. If not configured, state locking will be disabled.

Terraform stores its state as a key in a given bucket on S3. This backend also uses state locking and consistency checking via DynamoDB. A single DynamoDB table can be used to lock multiple remote state files.

The backend details for the different environments will be stored in the `tfbackend` folder. Each backend configuration file will contain the details of the S3 bucket, S3 key where the Terraform state is written to, AWS region and the DynamoDB table for state locking and consitency checking.