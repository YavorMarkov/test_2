variable "project_id" {
    description = "The Google Cloud project ID"
    type        = string
}

variable "region" {
    description = "The region to host the Google Cloud resources"
    type        = string
}

variable "GOOGLE_CREDENTIALS" {
    description = "The JSON credentials for Google Cloud"
    type        = string
    sensitive   = true
}

output "instance_ip" {
    value = google_compute_instance.enhanced_vm.network_interface[0].access_config[0].nat_ip
}
