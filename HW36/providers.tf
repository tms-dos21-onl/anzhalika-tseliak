terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.3"
    }
    time = {
      source = "hashicorp/time"
      version = "0.12.0"
    }
    
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

provider "null" {
}
