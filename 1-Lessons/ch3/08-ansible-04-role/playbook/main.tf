resource "yandex_vpc_network" "vms0803net" {
  name = "vms0803net"
}

resource "yandex_vpc_subnet" "vms0803subnet" {
  name           = "vms0803subnet"
  zone           = var.default_zone
  network_id     = "${yandex_vpc_network.vms0803net.id}"
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "centos" {
  family = "centos-7"
}

resource "yandex_compute_instance" "vms0803" {
  for_each = {
    clickhouse = "clickhouse-01"
    vector = "vector-01"
    lighthouse = "lighthouse-01"
  }
  name = each.value
  resources {
    cores  = 2
    memory = 2
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.vms0803subnet.id}"
    nat = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.id
    }
  }
  metadata = {
    type      = each.key
    ssh-keys = "root:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "local_file" "inventory" {
    content = templatefile("inventory.tmpl",
        {
      vms = yandex_compute_instance.vms0803
        }
        )
        filename = format("%s/%s", abspath(path.root), "prod.yaml")
}

resource "local_file" "vars" {
    content = templatefile("vars.tmpl",
        {
      vms = yandex_compute_instance.vms0803
        }
        )
        filename = format("%s/%s", abspath(path.root), "./group_vars/all/vars.yml")
}
