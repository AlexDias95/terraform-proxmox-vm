resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = var.vm_name
  bios              = "ovmf"
  target_node       = "pve01"
  clone             = var.vm_template
  cores             = var.vm_cpu
  sockets           = "1"
  cpu               = "host"
  memory            = var.vm_ram
disk {
    size            = var.vm_disk
    type            = "scsi"
    storage         = "local-lvm"
  }
network {
    model           = "virtio"
    bridge          = "vmbr1"
  }
}
