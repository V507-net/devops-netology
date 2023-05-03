output "external_ip_address_platform_yandex_cloud" {
  value = "${yandex_compute_instance.platform.network_interface.0.nat_ip_address}"
}
output "external_ip_address_platformdb_yandex_cloud" {
  value = "${yandex_compute_instance.platformdb.network_interface.0.nat_ip_address}"
}
