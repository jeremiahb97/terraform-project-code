provider "google" {
  project = "alien-drake-271918"
  region  = "us-central1"
}

resource "google_storage_bucket" "example_bucket" {
  name          = "mynewbucket9393"
  location      = "US"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

provider "google" {
    project = "alien-drake-271918"
    region = "us-central1"
}

resource "google_compute_instance" "example_instance" {

    name = "my-new-instance"
    machine_type = "e2-medium"
    zone = "us-central1-a"
    boot_disk {
        initialize_params {
            image = "projects/debian-cloud/global/images/family/debian-10"
        }
    }
    network_interface {
        network = "default"
        access_config {
            name = "External NAT"
            network_tier = "PREMIUM"
        }
    }
}