 
 ---
 
 ### `global/backend-bootstrap/main.tf`
 
 ```hcl
 terraform  {
    required_version  =  ">= 1.5.0"
 
     required_providers {
        aws  =  {
            source   =  "hashicorp/aws"
            version =  "~>  5.0"
        }
    }
 }
 
 provider  "aws" {
     region  = var.region
 }
 
 resource  "aws_s3_bucket" "tf_state"  {
     bucket =  var.state_bucket_name
 
    versioning  {
        enabled  =  true
    }
 
    server_side_encryption_configuration  {
        rule  {
            apply_server_side_encryption_by_default {
                sse_algorithm =  "AES256"
            }
        }
    }
 
    lifecycle  {
        prevent_destroy  =  true
    }
 
    tags  =  {
        Name       =  "tf-state"
        Project  =  "advanced-terraform-platform"
    }
 }
 
resource  "aws_dynamodb_table"  "tf_locks"  {
    name                =  var.lock_table_name
     billing_mode =  "PAY_PER_REQUEST"
     hash_key         = "LockID"
 
     attribute {
        name  =  "LockID"
        type  =  "S"
    }
 
    tags  =  {
        Name       =  "tf-locks"
        Project  = "advanced-terraform-platform"
     }
 }
