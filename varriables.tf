
variable "project_id" {
    description = "The Google Cloud project ID"
    type        = string
}

variable "region" {
    description = "The region to host the Google Cloud resources"
    type        = string
}

variable "zone" {
    description = "The zone to deploy resources in"
    type        = string
    default     = "us-central1-f"
}

variable "image" {
    description = "The image to use for the boot disk"
    type        = string
    default     = "debian-cloud/debian-11"
}

variable "GOOGLE_CREDENTIALS" {
    description = "The JSON credentials for Google Cloud"
    type        = string
    sensitive   = true
}

