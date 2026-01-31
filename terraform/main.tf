# GCS Bucket 
resource "google_storage_bucket" "tf_state" {
  name          = var.gcs_bucket_name
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
}

# Artifact Registry
resource "google_artifact_registry_repository" "docker_repo" {
  location      = var.region
  repository_id = var.gar_repo_name
  description   = "Docker repository for microservices"
  format        = "DOCKER"
}

# GKE Autopilot Cluster
resource "google_container_cluster" "autopilot_cluster" {
  name     = var.gke_cluster_name
  location = var.region

  enable_autopilot = true

  release_channel {
    channel = "REGULAR"
  }

  networking_mode = "VPC_NATIVE"
}
