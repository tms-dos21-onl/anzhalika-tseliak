terraform {
  backend "gcs" {
    bucket = "hw36-project-tf-state"
    prefix = "terraform/state"
  }
}