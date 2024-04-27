packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.6"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}
variable "centos_image" {
  type    = string
  default = "CentOS-7-x86_64-DVD-2009.iso"
}

variable "proxmox_iso_pool" {
  type    = string
  default = ""
}

variable "proxmox_node" {
  type    = string
  default = ""
}

variable "proxmox_password" {
  type    = string
  default = ""
}

variable "proxmox_storage_format" {
  type    = string
  default = ""
}

variable "proxmox_storage_pool" {
  type    = string
  default = ""
}

variable "proxmox_storage_pool_type" {
  type    = string
  default = ""
}

variable "proxmox_url" {
  type    = string
  default = ""
}

variable "proxmox_username" {
  type    = string
  default = ""
}

variable "template_description" {
  type    = string
  default = "CentOS 7 2009 Template"
}

variable "template_name" {
  type    = string
  default = "packer-CentOS7-Template"
}

variable "version" {
  type    = string
  default = ""
}

source "proxmox-iso" "autogenerated_1" {
  boot_command = ["<up><wait><tab><wait> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>"]
  boot_wait    = "10s"
  cores        = "4"
  disks {
    disk_size    = "8G"
    format       = "${var.proxmox_storage_format}"
    type         = "scsi"
    storage_pool = "${var.proxmox_storage_pool}"
  }
  http_directory           = "centos7"
  insecure_skip_tls_verify = true
  iso_file                 = "${var.proxmox_iso_pool}/${var.centos_image}"
  memory                   = "2048"
  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
  node                    = "${var.proxmox_node}"
  os                      = "l26"
  password                = "${var.proxmox_password}"
  proxmox_url             = "${var.proxmox_url}"
  scsi_controller         = "virtio-scsi-single"
  ssh_password            = "Packer"
  ssh_port                = 22
  ssh_timeout             = "15m"
  ssh_username            = "root"
  template_description    = "${var.template_description}"
  template_name           = "${var.template_name}"
  unmount_iso             = true
  cloud_init              = true
  cloud_init_storage_pool = "${var.proxmox_storage_pool}"
  username                = "${var.proxmox_username}"
  vm_id                   = "9010"
}

build {
  sources = ["source.proxmox-iso.autogenerated_1"]

  name = "proxmox-centos7"

  provisioner "shell" {
    inline = ["yum install -y cloud-init cloud-utils-growpart gdisk", "shred -u /etc/ssh/*_key /etc/ssh/*_key.pub", "rm -f /var/run/utmp", ">/var/log/lastlog", ">/var/log/wtmp", ">/var/log/btmp", "rm -rf /tmp/* /var/tmp/*", "unset HISTFILE; rm -rf /home/*/.*history /root/.*history", "rm -f /root/*ks", "passwd -d root", "passwd -l root"]
  }

}
