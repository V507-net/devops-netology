resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = local.image_name
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm1_name
  platform_id = "standard-v1"

    resources {
    cores         = var.vm_web_res["cores"]
    memory        = var.vm_web_res["memory"]
    core_fraction = var.vm_web_res["core_fraction"]
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    serial-port-enable = var.vm_meta_serial
    ssh-keys = var.vm_meta_ssh_key  
  }
}

resource "yandex_compute_instance" "platformdb" {
  name        = local.vm2_name
  platform_id = "standard-v1"

    resources {
    cores         = var.vm_db_res["cores"]
    memory        = var.vm_db_res["memory"]
    core_fraction = var.vm_db_res["core_fraction"]
  }

boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vm_meta_serial
    ssh-keys = var.vm_meta_ssh_key	
  }
}

