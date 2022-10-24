resource "google_compute_subnetwork" "subnetwork-internal-ipv6" {
  name          = "internal-ipv6-test-subnetwork"

  ip_cidr_range = "10.0.0.0/22"
  region        = "europe-west3"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"

  network       = google_compute_network.custom-test.id

}

resource "google_compute_network" "custom-test" {
  name                    = "internal-ipv6-test-network"
  auto_create_subnetworks = false
  enable_ula_internal_ipv6 = false
}


resource "google_compute_firewall" "default" {
  name    = "test-ssh"
  network = google_compute_network.custom-test.name

  allow {
    protocol = "icmp"
  }
  source_ranges = [ "0.0.0.0/0" ]
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["ssh"]
}
