output "instance_ip" {
    description = "The public IP address of the Google Compute Engine instance"
    value       = google_compute_instance.enhanced_vm.network_interface[0].access_config[0].nat_ip
}