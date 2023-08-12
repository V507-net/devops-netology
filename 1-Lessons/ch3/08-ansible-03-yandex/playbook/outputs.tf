output "PublicIP" {
value = {for a, b in yandex_compute_instance.vms0803: a => b.network_interface[*].nat_ip_address}
}
