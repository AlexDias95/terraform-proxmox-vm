terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.3"
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
