# see */packer.pkr.hcl for a full list of possible variable values to override here
proxmox_node              = "pve"
proxmox_url               = "https://10.0.0.254:8006/api2/json"
proxmox_storage_pool      = "local-zfs"
proxmox_password          = "Your_Password"
proxmox_username          = "root@pam"
proxmox_storage_pool_type = "zfspool"
proxmox_iso_pool          = "local:iso"
rh_username               = "Your_Login"
rh_password               = "Your_Password"
# proxmox_storage_pool_type = type of storage pool, `lvm-thin` (default), `lvm` , `zfspool` or `directory`
proxmox_storage_format = "raw"
#proxmox_storage_format = storage format, `raw` (default), `cow`, `qcow`, `qed`, `qcow2`, `vmdk` or `cloop`
# centos_image or ubuntu_image = The OS image.
# template_name = Name of the template. Defaults to `CentOS7-Template` or `CentOS8=Template` depending on version
# template_description = Template description. Defaults to `CentOS 7 Template` or `CentOS 8 Template` depending on image being built.
