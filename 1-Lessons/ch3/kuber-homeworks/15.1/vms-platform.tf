variable "yc_token" {
}

variable "yc_cloud_id" {
}

variable "yc_folder_id" {
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable network_name {
  type        = string
  default     = "default"
  description = "VPC Network Kub"
}

variable public_network {
  type = object({
    name        = string
    cidr_blocks = list(string)
    description = string
  })

  default     = {
    "name" = "public"
    "cidr_blocks" = ["192.168.10.0/24"]
    "description" = "public network"
  }
  description = "public network"
}

variable private_network {
  type = object({
    name        = string
    cidr_blocks = list(string)
    description = string
  })

  default     = {
    "name" = "private"
    "cidr_blocks" = ["192.168.20.0/24"]
    "description" = "private network"
  }
  description = "private network"
}

variable nat_kub {
  type        = map
  default     = {
    "name" = "natkub"
    "ip" = "192.168.10.254"
    "image_id" = "fd80mrhj8fl2oe87o4e1"
    "cpu" = 2
    "memory" = 2
  }
  description = "nat inst"
}

variable vm_kub {
  type        = map
  default     = {
    "image_id" = "fd8iif1k3s3b5bmrvd9l"
    "cpu" = 2
    "memory" = 2
  }
  description = "test vm"
}

variable vm_meta_ssh_key {
  type        = string
}
