variable "project" {
  type        = string
  description = "Project"
}

variable "region" {
  type        = string
  description = "Project region"
}

variable "network" {
  type        = string
  description = "Network name"
}

variable "machine_type" {
  type = string
  description = "Machine type"
}

variable "zones" {
  type = list(string)
  description = "Availability zone"
}

#Переменная первого задания:
#
#variable "zone" {
#  type        = string
#  description = "Availability zone"
#  default     = "us-central1-b"
#}

variable "enable_public_ip" {
  type = bool
  description = "Enable public ip"
}

variable "image_project" {
  type = string
  description = "Image project"
}

variable "image_family" {
  type = string
  description = "Image family"
}

variable "firewall_name" {
  type = string
  description = "Firewall name"
}

variable "protocol" {
    type = string
    description = "Protocol"
}