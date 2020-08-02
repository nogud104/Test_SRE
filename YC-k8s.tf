provider "yandex" {
  token     = "f${var.token}"
  cloud_id  = "f${var.cloud_id}"
  folder_id = "${var.folder_id}"
}

resource "yandex_compute_instance" "vm-1" {
  name = "k8s-node1"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 8
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cpqeflg039ibkphbo"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = "10.0.0.8"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/yandex-cloud-terraform/.ssh/yes.pub")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "k8s-node2"
  zone = "ru-central1-b"

  resources {
    cores  = 2
    memory = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cpqeflg039ibkphbo"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = "10.0.0.9"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/yandex-cloud-terraform/.ssh/yes.pub")}"
  }
}

resource "yandex_compute_instance" "vm-3" {
  name = "k8s-node3"
  zone = "ru-central1-c"

  resources {
    cores  = 2
    memory = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8cpqeflg039ibkphbo"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = "10.0.0.10"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/yandex-cloud-terraform/.ssh/yes.pub")}"
  }
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}

output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address

}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "internal_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}
