output "ip-adresses" {
  description = "VM ip-addresses"
  value       = values(google_compute_address.ip_address)[*].address
}
