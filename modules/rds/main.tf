variable  "name"               { type  =  string  }
variable "vpc_id"           {  type  =  string }
variable  "subnet_ids"    { type  =  list(string)  }
variable "db_username"  {  type  =  string }
variable  "db_password"  {  type =  string  }
variable  "allocated_storage" {
    type       =  number
   default  =  20
}
variable  "tags"  {
   type        = map(string)
    default  = {}
}

resource  "aws_db_subnet_group" "this"  {
    name            =  "${var.name}-db-subnet-group"
   subnet_ids  =  var.subnet_ids

   tags  =  var.tags
}

resource  "aws_db_instance"  "this"  {
   identifier                    =  "${var.name}-postgres"
   engine                           =  "postgres"
   engine_version             =  "15.3"
   instance_class             = "db.t3.micro"
    allocated_storage       =  var.allocated_storage
   username                        = var.db_username
    password                       =  var.db_password
   db_subnet_group_name  =  aws_db_subnet_group.this.name
   storage_encrypted        = true
    skip_final_snapshot   =  true
    publicly_accessible   =  false

   tags  =  var.tags
}
