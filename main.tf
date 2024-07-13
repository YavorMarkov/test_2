terraform {
    required_providers {
    google = {
        source  = "hashicorp/google"
        version = "~> 3.5"
    }
    }

    backend "remote" {
        hostname     = "app.terraform.io"
        organization = "test-1"

    workspaces {
        name = "test1"
    }
    }
}

provider "google" {
    project = var.project_id
    region  = var.region
}

resource "google_compute_instance" "enhanced_vm" {
    name         = "enhanced-vm"
    machine_type = "n1-standard-1"
    zone         = "us-central1-f"

    tags = ["web", "dev"]

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    persistent_disk {
        source = google_compute_disk.my_disk.id
    }

    network_interface {
    network = "default"
    access_config {
      // Ephemeral IP for external access
    }
    }

    metadata = {
    startup-script-url = "https://raw.githubusercontent.com/your-username/your-repo/main/startup.sh"
    }


    
}

resource "google_compute_disk" "my_disk" {
    name  = "persistent-disk"
    type  = "pd-ssd"
    zone  = "us-central1-f"
    size  = 50
}

resource "google_compute_firewall" "default" {
    name    = "default-allow-http"
    network = "default"

    allow {
        protocol = "tcp"
        ports    = ["80",  "443"]
    }

    source_ranges = ["0.0.0.0/0"]

    target_tags = ["web"]
}



