# Configure the Google Cloud Provider
provider "google" {
  project = "your-project-id" # Replace with your GCP Project ID
  region  = "us-central1"
}

# Create the GCS Bucket
resource "google_storage_bucket" "my_bucket" {
  name          = "unique-bucket-name-2026" # Must be globally unique
  location      = "US"
  force_destroy = true # Allows deleting the bucket even if it contains objects

  # Optional: Standard storage class
  storage_class = "STANDARD"

  # Recommended: Prevent public access by default
  public_access_prevention = "enforced"

  # Optional: Enable versioning to recover deleted files
  versioning {
    enabled = true
  }

  # Optional: Lifecycle rule to delete files after 30 days
  lifecycle_rule {
    condition {
      age = 31
    }
    action {
      type = "Delete"
    }
  }
}
