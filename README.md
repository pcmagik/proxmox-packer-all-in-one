🚀 Packer Builder for Proxmox - From CentOS to Red Hat! 🌌
Discover a new generation of image building automation with this project! Our Packer configurations are crafted for Proxmox, offering a foundation for more advanced customizations of operating system images such as CentOS, Rocky Linux, Ubuntu, Debian, AlmaLinux, and Red Hat.

🌟 Tested on Proxmox 8.x - now supporting an even wider range of OS!

🚀 Getting Started
Requirements:

Clone this repo: git clone https://github.com/pcmagik/HomeLab-Proxmox-Packer
ISO files of the selected OS, uploaded to Proxmox (download links below).
A functional Proxmox system.
Packer version 1.9.4.
The builder machine must be accessible to Proxmox, or the kickstart files must be hosted publicly.
Make sure the OS ISO file is uploaded to your Proxmox system.

The simplest method is to use the "Download from URL" option in Proxmox on the disk/share designated for ISO files.

🛠 Building an Image
Ensure Proxmox can access the host running Packer. Packer will briefly run an HTTP server to allow the installer to download the kickstart file. Otherwise, host the kickstart files on a publicly accessible server.

Find your Proxmox system URL, the node name for building, and the username and password of a user with VM and template creation privileges. Customize your install or specify a storage pool other than the default if necessary.

Edit the variables.pkrvars.hcl file with all required information. A full list of modifiable variables is available in each packer.pkr.hcl file.

🛠 Using the Makefile
Build templates by running:

* `make all`

🛠 Manual Building
Without the Makefile, use the following commands:

For Each OS Version
(Example commands for almalinux8, almalinux9, centos7, etc.)


* `make almalinux8`
* `make almalinux9`
* `make centos7`
* `make centos8`
* `make debian10`
* `make debian11`
* `make debian12`
* `make redhat8`
* `make redhat9`
* `make rocky8`
* `make rocky9`
* `make ubuntu2004`
* `make ubuntu2204`


Add a file variables.pkrvars.hcl in the main folder with the following contents:
(List the variables that can be set, in accordance with the available options for the Proxmox builder.)


🚀 Getting Started with the Template

All builds are prepare with custom name, password and ssh key. You can find the details in the template.pkr.hcl, ks.cfg and user-data file.
This build is All in One, so you can use it as a template for your VMs. Ready out of the box. Just change your username,password, ssh key and you are ready to go.

🌟 After Building the Image
After building the image You can adjust the remaining settings in cloud-init drive. Ready to use image will be available in Proxmox as a template.


The full list of variables you can customize is:

* see */packer.pkr.hcl for a full list of possible variable values to override here

* `proxmox_username` # username to log into Proxmox as
* `proxmox_password` # password to log into Proxmox as
* `proxmox_url` # URL of your Proxmox system
* `proxmox_node` # name of the Proxmox node to build on
* `proxmox_storage_pool` # name of the storage pool the image should be built on
* `proxmox_storage_pool_type` # type of storage pool, `lvm-thin` (default), `lvm` , `zfspool` or `directory`
* `proxmox_storage_format` # storage format, `raw` (default), `cow`, `qcow`, `qed`, `qcow2`, `vmdk` or `cloop`
* `centos_image` or `ubuntu_image` # The OS image.
* `template_name` # Name of the template. Defaults to `CentOS7-Template` or `CentOS8-Template` depending on version
* `template_description` # Template description. Defaults to `CentOS 7 Template` or `CentOS 8 Template` depending on image being built.


🌟 This repository is a fork of few repositories listed down below and it's all work by @pcmagik.

The source repository can be found here:

`https://github.com/dustinrue/proxmox-packer`

`https://github.com/brockhenrie/Templates`

`https://github.com/ChristianLempa/boilerplates/tree/main/packer/proxmox`

`https://github.com/rkoosaar/packer-proxmox-iso-templates`

`https://github.com/geerlingguy/packer-boxes`


🌟 What changed from the original repository?
* Update Packer to latest version at this moment what is 1.9.4
* Update Packer Proxmox-ISO builder to latest version what is 1.1.6
* All VMs has password enabled
* All VMs has user enabled
* All VMs has ssh key enabled
* All VMs has cloud-init enabled
* All VMs has cloud-init drive enabled
* All VMs has cloud-init network enabled
* All VMs has cloud-init timezone enabled

## 🌟 What's Next?
- Update Packer to the latest version, which is currently 1.10.3
- Update the Packer Proxmox-ISO Builder to the latest version, which is currently 1.1.7

[🇵🇱 Polish version of this file](README_PL.md)