provider "proxmox" {
    pm_api_url = "https://${proxmox_ip}:8006/api2/json"
    pm_user = "${proxmox_user}@pam"
    pm_password = "${proxmox_password}"
    pm_tls_insecure = "true"
}