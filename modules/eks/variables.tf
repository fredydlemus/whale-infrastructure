variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID in which to create the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "Subnets where the EKS cluster will be deployed (typically private subnets)"
  type        = list(string)
}
variable "ec2_key_pair" {
  description = "EC2 Key Pair name for SSH access (optional)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}