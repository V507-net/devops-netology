output "external_ip_address_nat_yandex_cloud" {
  value = "${yandex_compute_instance.nat.network_interface.0.nat_ip_address}"
}
output "external_ip_address_public_vm_yandex_cloud" {
  value = "${yandex_compute_instance.public_vm.network_interface.0.nat_ip_address}"
}
output "external_ip_address_private_vm_yandex_cloud" {
  value = "${yandex_compute_instance.private_vm.network_interface.0.nat_ip_address}"
}
