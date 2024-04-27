proxmox_storage_pool = local-zfs

.PHONY: almalinux8 almalinux9 centos7 centos8 debian10 debian11 debian12 redhat8 redhat9 rocky8 rocky9 ubuntu2004 ubuntu2204 all

all: almalinux8 almalinux9 centos7 centos8 debian10 debian11 debian12 redhat8 redhat9 rocky8 rocky9 ubuntu2004 ubuntu2204

almalinux8:
	packer init almalinux8/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl almalinux8/packer.pkr.hcl

almalinux9:
	packer init almalinux9/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl almalinux9/packer.pkr.hcl

centos7:
	packer init centos7/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl centos7/packer.pkr.hcl

centos8:
	packer init centos8/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl centos8/packer.pkr.hcl

debian10:
	packer init debian10/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl debian10/packer.pkr.hcl

debian11:
	packer init debian11/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl debian11/packer.pkr.hcl

debian12:
	packer init debian12/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl debian12/packer.pkr.hcl

redhat8:
	packer init redhat8/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl redhat8/packer.pkr.hcl

redhat9:
	packer init redhat9/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl redhat9/packer.pkr.hcl

rocky8:
	packer init rocky8/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl rocky8/packer.pkr.hcl

rocky9:
	packer init rocky9/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl rocky9/packer.pkr.hcl

ubuntu2004:
	packer init ubuntu2004/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl

ubuntu2204:
	packer init ubuntu2204/packer.pkr.hcl && \
	packer build -force -var-file variables.pkrvars.hcl ubuntu2204/packer.pkr.hcl
