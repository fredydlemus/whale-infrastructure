variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

variable "image_tag_mutability" {
  description = "Specifies whether images are mutable or immutable. Valid values: MUTABLE, IMMUTABLE."
  type        = string
  default     = "MUTABLE"
}

variable "scan_on_push" {
  description = "Enable or disable image scanning on push."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to apply to the repository."
  type        = map(string)
  default     = {}
}
