resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = var.vm-name
  bios              = "ovmf"
  target_node       = "pve01"
  clone             = var.vm-template
  cores             = var.vm-cpu
  sockets           = "2"
  cpu               = "host"
  memory            = var.vm-ram
disk {
    size            = var.vm-disk
    type            = "scsi"
    storage         = "local-lvm"
  }
network {
    model           = "virtio"
    bridge          = "vmbr1"
  }
}
