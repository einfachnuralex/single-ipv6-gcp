resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "c2d-highcpu-8"
  zone         = "europe-west3-c"
  can_ip_forward = true

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20220924"
      size = 100
      type = "pd-balanced"
    }
  }

  tags = ["ssh"]

  network_interface {
    stack_type = "IPV4_IPV6"
    subnetwork = google_compute_subnetwork.subnetwork-internal-ipv6.name
    access_config {}
    # ipv6_access_config {
    #   network_tier = "STANDARD"
    # }

  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_key}"
  }
  metadata_startup_script = "apt update && apt install -y make docker.io golang && gpasswd -a ${var.ssh_user} docker"

}