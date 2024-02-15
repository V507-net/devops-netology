resource "yandex_compute_instance" "nat" {
  name        = var.nat_kub.name

  resources {
    cores  = var.nat_kub.cpu
    memory = var.nat_kub.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_kub.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = var.nat_kub.ip
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${var.vm_meta_ssh_key}"
  }
}

resource "yandex_compute_instance" "public_vm" {
  name        = "public-vm"

  resources {
    cores  = var.vm_kub.cpu
    memory = var.vm_kub.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_kub.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat = true
  }

  metadata = {
    ssh-keys = "centos:${var.vm_meta_ssh_key}"
  }
}

resource "yandex_compute_instance" "private_vm" {
  name        = "private-vm"

  resources {
    cores  = var.vm_kub.cpu
    memory = var.vm_kub.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_kub.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }

  metadata = {
    ssh-keys = "centos:${var.vm_meta_ssh_key}"
  }
}


resource "yandex_vpc_network" "network" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "public" {
  name           = var.public_network.name
  v4_cidr_blocks = var.public_network.cidr_blocks
  network_id     = yandex_vpc_network.network.id
  description    = var.public_network.description
}

resource "yandex_vpc_subnet" "private" {
  name           = var.private_network.name
  v4_cidr_blocks = var.private_network.cidr_blocks
  network_id     = yandex_vpc_network.network.id
  description    = var.private_network.description
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_route_table" "rt" {
  network_id = yandex_vpc_network.network.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = var.nat_kub.ip
  }
}

