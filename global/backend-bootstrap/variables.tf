 variable  "region"  {
    type               = string
     default         =  "eu-central-1"
    description  =  "AWS region  for  backend  resources"
 }

 variable  "state_bucket_name"  {
    type               = string
     description  = "S3  bucket  name  for  Terraform state"
 }
 
 variable  "lock_table_name" {
     type              =  string
    description  =  "DynamoDB  table  name for  state  locking"
 }
