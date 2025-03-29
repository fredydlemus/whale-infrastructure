module "microservices_ecr" {
  source               = "../../modules/ecr"
  repository_name      = "microservices_repo"
  image_tag_mutability = "IMMUTABLE"
  scan_on_push         = true
  tags = {
    Environment = "dev"
    Project     = "whale-app"
  }
}

module "vpc" {
  source          = "../../modules/vpc"
  vpc_name        = "dev-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  tags = {
    Environment = "dev"
    Project     = "whale-app"
  }

}

module "eks" {
  source       = "../../modules/eks"
  cluster_name = "dev-cluster"
  eks_version  = "1.29"
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.public_subnets # Public subnets for EKS (remove when using private subnets)

  tags = {
    Environment = "dev"
    Project     = "whale-app"
  }


}