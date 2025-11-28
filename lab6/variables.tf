variable "aws_region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS region"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment name (dev/stage/prod)"
}
