terraform  {
   backend  "s3"  {
       bucket                =  "advanced-tf-platform-state"
       key                     =  "envs/dev/terraform.tfstate"
       region                =  "eu-central-1"
       dynamodb_table  =  "advanced-tf-platform-locks"
       encrypt              =  true
   }
}
