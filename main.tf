provider "google" {
  project = "alien-drake-271918"
  region  = "us-central1"
}

resource "google_storage_bucket" "example_bucket" {
  name          = "mynewbucket9292"
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