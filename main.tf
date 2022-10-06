terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.38.0"
    }
  }
}


provider "google" {
  credentials = file("terraform-test-gcp.json")

  project = var.gcp_project
  region  = "europe-west3"
  zone    = "europe-west3-a"
}
