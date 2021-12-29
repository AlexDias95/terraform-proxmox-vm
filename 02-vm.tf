resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = "${vm_name}"
  target_node       = "pve01"
clone             = "${vm_template}"
os_type           = "cloud-init"
  cores             = "${vm_cpu}"
  sockets           = "1"
  cpu               = "host"
  memory            = "${vm_ram}"
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
disk {
    id              = 0
    size            = "${vm_disk}"
    type            = "scsi"
    storage         = "data2"
    storage_type    = "lvm"
    iothread        = true
  }
network {
    id              = 0
    model           = "virtio"
    bridge          = "vmbr1"
  }
lifecycle {
    ignore_changes  = [
      network,
    ]
  }
}