variable "project" {
  description = "The project ID to host the site in."
  type        = string
}

variable "project_region" {
  description = "The region is location for your resources to be created in."
  type        = string
  default     = "us-central1"
}

variable "project_zone" {
  description = "The zone is location for your resources to be created in."
  type        = string
  default     = "us-central1-c"
}

#bucket
variable "bucket_name" {
  description = "Name for created bucket."
  type        = string
  default     = "static-website-terraform"
}

variable "bucket_location" {
  description = "Bucket location."
  type        = string
  default     = "EU"
}

variable "bucket_backend_name" {
  description = "Name for created backend bucket."
  type        = string
  default     = "terraform-state-file2"
}