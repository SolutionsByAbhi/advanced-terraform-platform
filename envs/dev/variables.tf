variable "region"  {
    type              =  string
   description  =  "AWS  region"
}

variable  "db_username"  {
   type              =  string
    description =  "RDS  master  username"
}

variable  "db_password"  {
   type               = string
    description  = "RDS  master  password"
   sensitive      =  true
}
