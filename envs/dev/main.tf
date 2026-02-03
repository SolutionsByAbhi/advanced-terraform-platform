locals  {
   env    = "dev"
    tags  = {
       Environment  =  local.env
       Project         =  "advanced-terraform-platform"
   }
}

module "network"  {
    source =  "../../modules/network"

   name                                 =  "adv-tf-${local.env}"
   cidr_block                      = "10.10.0.0/16"
    public_subnet_cidrs     =  ["10.10.1.0/24",  "10.10.2.0/24"]
   private_subnet_cidrs    =  ["10.10.11.0/24", "10.10.12.0/24"]
    azs                                  =  ["eu-central-1a",  "eu-central-1b"]
   tags                                =  local.tags
}

module "eks"  {
    source =  "../../modules/eks"

   name                      =  "adv-tf-${local.env}"
   vpc_id                  =  module.network.vpc_id
   private_subnets  =  module.network.private_subnet_ids
   tags                      =  local.tags
}

module  "rds"  {
   source  =  "../../modules/rds"

   name                         =  "adv-tf-${local.env}"
   vpc_id                      =  module.network.vpc_id
   subnet_ids               = module.network.private_subnet_ids
    db_username            =  var.db_username
    db_password            =  var.db_password
   allocated_storage  =  20
   tags                          = local.tags
}

module  "observability" {
    source  = "../../modules/observability"

    name =  "adv-tf-${local.env}"
    tags =  local.tags
}
