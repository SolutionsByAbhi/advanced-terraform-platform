variable "name"  {
    type              =  string
   description  =  "Name  prefix"
}

variable  "cidr_block"  {
   type              =  string
    description =  "VPC  CIDR"
}

variable  "public_subnet_cidrs"  {
   type               =  list(string)
   description  =  "Public subnet  CIDRs"
}

variable "private_subnet_cidrs"  {
    type              =  list(string)
   description  =  "Private  subnet CIDRs"
}

variable  "azs" {
    type              =  list(string)
   description  =  "Availability  zones"
}

variable  "tags"  {
   type               = map(string)
    default         =  {}
}
