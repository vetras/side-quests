# PluralSight course

Terraform - Getting Started :: `https://app.pluralsight.com/courses/36823bfe-0f74-43b2-ac5d-760bb7dbe19d/table-of-contents`

WIP next is: chapter 9: Using Workspaces for Multiple Environments
https://app.pluralsight.com/course-player?clipId=bb9b8dbf-04b3-466f-9f02-a6b636808618

## Example Version

We have different examples of the same app.
Each adds new TF features as we learn them.

 1. v1 is the base structure that creates 1 EC2 serving a static website
 1. v2 adds another instance and one load balancer
 1. v3 makes our static site code come from a S3 bucket. We remove the need of custom ENV vars for AWS credentials
 1. v4 adds naming conventions, TF functions and TF loops to remove duplication
 1. v5 downloads a TF modules for VPC and we create a custom TF module for S3

## Main concepts

- There is a terraform executable (binary)
  - it is written in go
- config files (HCL)
- plugins and global repo for them
- state data
  - it is a mapping from what exists on your configuration and what was created on the environment
  - therefor, it is very important to have this state before running commands

## Object Types

Anything we create on HCL must be of one the following types:

- providers
- resources
- data source

---

- variable
- locals
- output

## Commands

    terraform init                     # must be run once per host, before other commands
    terraform validate                 # wont check state
    terraform plan -out plan-file-name
    terraform apply "plan-file-name"
    terraform destroy                  # removes all things created on the given configuration
    
    terraform show                     # list the current state of all resources
    terraform output                   # re-print the outputs
    terraform fmt                      # format all code files

    terraform refresh                  # Update the state file of your infrastructure to match the physical resources
    terraform state list
    terraform state show <addr>
    terraform state mv <src> <dest>
    terraform state rm <addr>          # remove a resource from TF management without removing it from the cloud 

Terraform will put together all the `.tf` files it finds on the same directory !

## Provide Variables to Terraform

Sensitive data that we can't commit:

    # USE ENV VARS -- the convention is TF_VAR_<name-on-tf-config>
    export TF_VAR_aws_access_key=AKIASKFFW7TSYTJVKDOD
    export TF_VAR_aws_secret_key=

Non-Sensitive data that we can commit: A file named `terraform.tfvars` is automatically picked up by the plan command.

More Info:

- https://www.terraform.io/language/values/variables#variable-definition-precedence
- https://www.terraform.io/language/values/variables

## Plan & Apply

Always provide an output file name when we plan:

    terraform plan -out globo-v1.tfplan

Always apply according to plan :

    terraform apply "m4.tfplan"

## Dependencies

How does TF know the order in which to create resources?

When resource B, directly references resource A, TF can infer this logic.
For example, TF knows it needs to create the VPC first, then the subnet:

```hcl
resource "aws_vpc" "vpc" {
   # ...
}

resource "aws_subnet" "subnet1" {
   vpc_id = aws_vpc.vpc.id
   # ...
}
```

TF will build this dependency tree internally for all things it is managing.

Sometimes, this won't be possible because there is no direct reference.
In theses cases we need to tell TF that Resource A depends on B, C, and do on.
For example:

```hcl
resource "aws_instance" "nginx2" {
  # ...
  depends_on = [aws_iam_role_policy.allow_s3_all]
}
```

**Best Practice:**

Allow TF to infer dependencies as much as possible.
Only add `depends_on` when it is actually needed.
