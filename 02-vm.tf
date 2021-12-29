resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = var.vm_name
  target_node       = "pve01"
clone             = var.vm_template
os_type           = "cloud-init"
  cores             = var.vm_cpu
  sockets           = "1"
  cpu               = "host"
  memory            = var.vm_ram
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
disk {
    id              = 0
    size            = var.vm_disk
    type            = "scsi"
    storage         = "local-lvm"
  }
network {
    model           = "virtio"
    bridge          = "vmbr1"
  }
}