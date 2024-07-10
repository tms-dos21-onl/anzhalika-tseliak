terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.37.0"
    }
  }
}

provider "google" {
  project = "anzhalika-tseliak-hw35"
  region  = "us-central1"
}

