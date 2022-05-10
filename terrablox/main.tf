variable "access_key" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "ca-central-1"
}