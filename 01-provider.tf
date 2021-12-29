terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://${var.proxmox_ip}:8006/api2/json"
    pm_user = "${var.proxmox_user}@pam"
    pm_password = var.proxmox_password
    pm_tls_insecure = "true"
}