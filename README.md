# Terraform AWS S3 Backend Starter Template

> Note: This solution assumes that you are familiar with Terraform and AWS.

This is a starter template to use Terraform with a S3 backend. This template can be used to launch AWS resources into different logical deployment environments (within the same AWS account or to different AWS accounts).

You would need appropriate IAM permissions to deploy resources into your AWS account.

## Prerequisites

To use this solution, a S3 bucket and a DynamoDB table should exist in your AWS account.

> Note: The DynamoDB table must be created with a partition key name `LockID` and type `String`. If not configured, state locking will be disabled.

Terraform stores its state as a key in a given bucket on S3. This backend also uses state locking and consistency checking via DynamoDB. A single DynamoDB table can be used to lock multiple remote state files.

The backend details for the different environments will be stored in the `tfbackend` folder. Each backend configuration file will contain the details of the S3 bucket, S3 key where the Terraform state is written to, AWS region and the DynamoDB table for state locking and consitency checking.

## Contents

In this repository, 3 example backend configuration files have been defined that map to 3 different environments, i.e., dev, test and prod.

Feel free to modify the name of the environments as per your requirements.

The `main.tf` file contains the Terraform configuration. The required version of Terraform is set to `"~> 1.8.5"` and the required version of the AWS provider is set to `"~> 5.55.0"`, which are the latest versions at the time of writing. Please update these versions as needed.

The `variables.tf` files can be used to define variables for your project. A few sample variables have been pre-populated for your reference. Feel free to modify them and/or add new variables as per your requirements.

The values for the defined variables for each environment should be configured in the `<env>.tfvars` files.

The `outputs.tf` file can be used to expose the output values about the infrastructure.

## Usage

To deploy to a specific AWS environment, please make sure that you have configured the AWS credentials that can be used by Terraform. For more information refer to [this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).

In the below commands, I'm using the `dev` environment as an example. Please use the environment names that you have used to define the backend and tfvars files.

### Initialization

```terraform
terraform init -backend-config=./tfbackend/dev.s3.tfbackend
```

### Plan

```terraform
terraform plan --var-file ./tfvars/dev.tfvars
```

### Apply

```terraform
terraform apply --var-file ./tfvars/dev.tfvars -auto-approve
```
