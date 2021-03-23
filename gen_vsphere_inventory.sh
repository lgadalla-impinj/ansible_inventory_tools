#!/bin/bash -e

if [ "$#" -ne 1 ]; then
    >&2 echo "$(basename ${0}): Usage: $(basename ${0}) <inventory file>"
    exit 1
fi

if [ -z ${VMWARE_USER+x} ]; then
  >&2 echo "$(basename ${0}): Env var VMWARE_USER is not set";
  exit 1
fi

if [ -z ${VMWARE_PASSWORD+x} ]; then
  >&2 echo "$(basename ${0}): Env var VMWARE_PASSWORD is not set";
  exit 1
fi

for host in $(ansible-inventory -i "${1}" --list | grep 'guest\.ipAddress' | sed 's/,$//' | awk -F ":" '{ print $2 }' | sed 's/"//g');
do
  (dig -x ${host} +short | sed 's/\.$//') || true
done

exit 0
