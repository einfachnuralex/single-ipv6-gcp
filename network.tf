resource "google_compute_subnetwork" "subnetwork-internal-ipv6" {
  name          = "internal-ipv6-test-subnetwork"

  ip_cidr_range = "10.0.0.0/22"
  region        = "europe-west3"

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "INTERNAL"

  network       = google_compute_network.custom-test.id
}

resource "google_compute_network" "custom-test" {
  name                    = "internal-ipv6-test-network"
  auto_create_subnetworks = false
  enable_ula_internal_ipv6 = true
}

# resource "google_compute_firewall_policy_rule" "default" {
#   priority = 9000
#   action = "allow"
#   direction = "INGRESS"
#   disabled = false
#   match {
#     layer4_configs {
#       ip_protocol = "tcp"
#       ports = [22]
#     }
#     dest_ip_ranges = ["11.100.0.1/32"]
#   }
# }