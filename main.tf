terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://${var.proxmox-ip}:8006/api2/json"
    pm_user = "${var.proxmox-user}@pam"
    pm_password = var.proxmox-password
    pm_tls_insecure = "true"
    pm_log_enable = true
    pm_log_file = "terraform-plugin-proxmox.log"
     pm_debug = true
    pm_log_levels = {
      _default = "debug"
      _capturelog = ""
    }
}



resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = var.vm-name
  bios              = "ovmf"
  target_node       = "pve01"
  clone             = var.vm-template
  cores             = var.vm-cpu
  sockets           = "1"
  cpu               = "host"
  memory            = var.vm-ram
disk {
    size            = var.vm-disk
    type            = "scsi"
    storage         = "local-fastlvm"
  }
network {
    model           = "virtio"
    bridge          = "vmbr1"
  }
}
