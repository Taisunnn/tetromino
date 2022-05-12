variable "access_key" {
  description = "Database administrator access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Database administrator secret key"
  type        = string
  sensitive   = true
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "ca-central-1"
}