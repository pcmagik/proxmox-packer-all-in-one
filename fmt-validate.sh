#!/bin/bash

# Formatowanie plików Packer HCL
echo "Formatowanie plików Packer HCL..."
packer fmt almalinux8/packer.pkr.hcl
packer fmt almalinux9/packer.pkr.hcl
packer fmt centos7/packer.pkr.hcl
packer fmt centos8/packer.pkr.hcl
packer fmt debian10/packer.pkr.hcl
packer fmt debian11/packer.pkr.hcl
packer fmt debian12/packer.pkr.hcl
packer fmt redhat8/packer.pkr.hcl
packer fmt redhat9/packer.pkr.hcl
packer fmt rocky8/packer.pkr.hcl
packer fmt rocky9/packer.pkr.hcl
packer fmt ubuntu2004/packer.pkr.hcl
packer fmt ubuntu2204/packer.pkr.hcl

echo "Formatowanie zakończone."

# Walidacja plików Packer HCL
echo "Walidacja plików Packer HCL..."
packer validate -var-file variables.pkrvars.hcl almalinux8/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl almalinux9/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl centos7/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl centos8/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl debian10/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl debian11/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl debian12/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl redhat8/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl redhat9/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl rocky8/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl rocky9/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl ubuntu2004/packer.pkr.hcl
packer validate -var-file variables.pkrvars.hcl ubuntu2204/packer.pkr.hcl

echo "Walidacja zakończona."
