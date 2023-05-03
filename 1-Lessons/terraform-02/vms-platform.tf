variable "vm_web_res" {
  type = map(any)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
}

variable "vm_db_res" {
  type = map(any)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

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
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "resource name"
}

variable "vm_web_image_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image name"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "resource name"
}

variable "vm_meta_serial" {
  type        = string
  default     = "1"
  description = "serial-port-enable = 1"
}

variable "vm_meta_ssh_key" {
}

