variable  "name"  {
   type  =  string
}

variable  "vpc_id"  {
   type  =  string
}

variable  "private_subnets"  {
   type  =  list(string)
}

variable  "tags"  {
   type       =  map(string)
   default  =  {}
}

resource  "aws_eks_cluster"  "this"  {
   name         =  "${var.name}-eks"
   role_arn  =  aws_iam_role.eks_cluster.arn

   vpc_config  {
       subnet_ids  =  var.private_subnets
   }

   tags  =  var.tags
}

resource  "aws_iam_role"  "eks_cluster"  {
   name  =  "${var.name}-eks-cluster-role"

    assume_role_policy  = jsonencode({
       Version  =  "2012-10-17"
       Statement  =  [{
          Effect  =  "Allow"
          Principal  =  {  Service  = "eks.amazonaws.com"  }
           Action       =  "sts:AssumeRole"
       }]
   })
}

resource "aws_eks_node_group"  "default"  {
   cluster_name        = aws_eks_cluster.this.name
    node_group_name  = "${var.name}-ng"
    node_role_arn     =  aws_iam_role.eks_nodes.arn
   subnet_ids           =  var.private_subnets

   scaling_config  {
       desired_size  =  2
       max_size         = 4
       min_size         =  1
    }

    instance_types  = ["t3.medium"]

    tags =  var.tags
}

resource "aws_iam_role"  "eks_nodes"  {
   name  =  "${var.name}-eks-nodes-role"

   assume_role_policy  =  jsonencode({
       Version  = "2012-10-17"
       Statement  =  [{
           Effect =  "Allow"
           Principal  = {  Service  =  "ec2.amazonaws.com"  }
          Action       =  "sts:AssumeRole"
       }]
    })
}
