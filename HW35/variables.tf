variable "vm_name" {
  type        = string
  description = "VM name"
}

variable "machine_type" {
  type        = string
  description = "Machine type"
}

variable "machine_zone" {
  type        = string
  description = "Machine zone"
  default     = "us-central1-b"
}