# Ansible Inventory Tools

Tools and scripts to help discover inventory for Ansible

## Files

- engineering.vmware.yml: Configuration file for [VMware Guest dynamic inventory](https://docs.ansible.com/ansible/latest/collections/community/vmware/vmware_vm_inventory_inventory.html) for the [Engineering vSphere cluster](https://engvcenter01.impinj.com/ui/)
- gen_vsphere_inventory.sh: Bash script to use dynamic inventory to generate inventory from vSphere clusters
- sysman.yml: Playbook to install sysman user with passwordless-sudo access on a host
- production.vmware.yml: Configuration file for [VMware Guest dynamic inventory](https://docs.ansible.com/ansible/latest/collections/community/vmware/vmware_vm_inventory_inventory.html) for the [Production vSphere cluster](https://wesxitvc02.impinj.com/ui/)
- README.md: This file
- scan_sshd.sh: Bash script to scan a set of pre-configured CIDR blocks for hosts that are listening on TCP port 22 (SSH)
