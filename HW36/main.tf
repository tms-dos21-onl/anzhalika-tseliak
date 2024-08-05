data "google_compute_image" "my_image" {
  family  = var.image_family
  project = var.image_project
}

resource "google_compute_network" "vpc_network" {
  name = var.network
}

resource "google_compute_address" "ip_address" {
  for_each = var.enable_public_ip == true ? toset(var.zones) : []
  name     = "ip-${each.key}"
}

resource "time_sleep" "name" {
  create_duration = "30s"
}

resource "google_compute_instance" "this" {
  for_each     = toset(var.zones)
  name         = "vm-${each.key}"
  machine_type = var.machine_type
  zone         = each.key

  depends_on = [
    time_sleep.name
  ]
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {
      nat_ip = google_compute_address.ip_address[each.key].address
    }
  }

}


#Создание vm c использованием dynamic блока из первого задания:

#resource "google_compute_instance" "this" {
#  name         = "tf-vm"
#  machine_type = var.machine_type
#  zone         = var.zone

#  boot_disk {
#   initialize_params {
#      image = data.google_compute_image.my_image.self_link
#    }
#  }

#  network_interface {
#    network = "default"
#    dynamic "access_config" {
#      for_each = var.enable_public_ip == true ? [""] : []
#      content {
 // if the variable's value is true, an ephemeral public IP will be created
#      }
#    }
#  }
#}


data "http" "this" {
  url = "https://ifconfig.me"
}


resource "google_compute_firewall" "firewall" {
  name          = var.firewall_name
  network       = google_compute_network.vpc_network.id
  source_ranges = [data.http.this.response_body]

  allow {
    protocol = var.protocol
  }
}

resource "null_resource" "name" {
   for_each = toset(var.zones)

  provisioner "local-exec" {
    command = "gcloud compute instances stop vm-${each.key} --project=${var.project} --zone=${each.key}"
  }
   depends_on = [ google_compute_instance.this ]
}

