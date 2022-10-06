resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "europe-west3-c"
  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20220924"
      size = 100
      type = "pd-balanced"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork-internal-ipv6.name

  }

  metadata = {
    ssh-keys = var.ssh_key
  }
  metadata_startup_script = "echo hi > /test.txt"

}