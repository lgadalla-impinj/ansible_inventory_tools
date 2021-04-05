# Ansible Inventory Tools

Tools and scripts to help discover inventory for Ansible

## Files

- README.md - this file
- ansible_vers.yml - Ansible playbook to show installed Ansible version
- engineering.vmware.yml - Configuration file for [VMware Guest dynamic inventory](https://docs.ansible.com/ansible/latest/collections/community/vmware/vmware_vm_inventory_inventory.html) for the [Engineering vSphere cluster](https://engvcenter01.impinj.com/ui/)
- gen_vsphere_inventory.sh - Bash script to use dynamic inventory to generate inventory from vSphere clusters
- sysman.yml - Playbook to install sysman user with passwordless-sudo access on a host
- scan_sshd.sh: Bash script to use [nmap](https://nmap.org/) to scan a set of pre-configured CIDR blocks for hosts that are listening on TCP port 22 (SSH)
- sudo_pkg.yml - Ansible playbook to show which sudo packages are installed
- sudo_vers.yml - Ansible playbook to show what sudo version is installed
- vsphere.vmware.yml.template - Template for Ansible VMware vSphere dynamic inventory source

## Usage

Assumes:

1. Copy vsphere.vmware.yml.template to engineering.vmware.yml
2. Edit engineering.vmware.yml as appropriate

Get inventory as a graph:

```
$ ansible-inventory --graph -i engineering.vmware.yml
```

Get inventory as a list:

```
$ ansible-inventory --list -i engineering.vmware.yml
```

Use sysman and sudo to restart Bamboo agents

```
$ ansible all -i ./engineering.vmware.yml -u sysman -k -m shell \
  -a "sudo su - bamboo -c '~/bamboo-agent-home/bin/bamboo-agent.sh restart'"
```
