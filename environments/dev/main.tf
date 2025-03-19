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