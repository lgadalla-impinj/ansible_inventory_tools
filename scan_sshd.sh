#!/bin/bash
# Scan networks for hosts with an open SSH TCP port (22)

SUDO="$(command -v sudo)"
NMAP="$(command -v nmap)"

if [ -z ${SUDO} ]; then
  echo "$(basename ${0}): Cannot find sudo, exiting..."
  exit 1
fi

if [ -z ${NMAP} ]; then
  echo "$(basename ${0}): Cannot find nmap, exiting..."
  exit 1
fi

CIDRS="10.100.210.0/24 10.100.211.0/24 10.100.212.0/24 10.100.213.0/24 10.100.214.0/24 10.100.232.0/22 172.18.1.0/24 172.18.2.0/24 172.18.3.0/24 172.18.4.0/24 172.18.5.0/24 172.18.25.0/24 172.18.26.0/24 172.18.27.0/24 172.18.28.0/24 172.18.29.0/24 172.18.30.0/24 10.160.10.0/24 10.160.11.0/24 10.160.12.0/24 10.160.50.0/24 10.160.51.0/24 10.160.52.0/24"

for cidr in ${CIDRS}
do
  echo ""
  echo "# Hosts in ${cidr} with TCP port ${PORT} open"
  #nmap -sT -p 22 ${cidr} -v -oG - | grep '/open/tcp/' | sed 's/[(,)]/;/g' | \
  # awk -F";" '{ print $2 }';
  ${SUDO} ${NMAP} -sT -p 22 ${cidr} -sV -R --open -oG - | grep '/open/tcp/' | \
   sed 's/Host: //' | sed 's/Ports: //' | sed 's/(/;/' | sed 's/)/;/' | \
   sed 's/ssh\/\//ssh;/' | sed s'/\/$//' | \
   awk -F";" '{ 
     if($2 == "") printf("%s  # %s\n", $1, $4)
     if($2 != "") printf("%s  # %s\n", $2, $4) }'
done
