
#!/bin/bash

#libvirt qemu kvm libvirt libguestfs-tools required to run installed on host.
# Variables

# vm location
ruta=/home/gbenselu/vdo/virtualmachines
#vm name convention, IP and MAC
vmMANE=""
vmIP=""
vmMAC=""
# napps number of vm_apps to create # laboratorio defines ansible lab name
laboratorio=""
napps=""

# variables input

echo "ingresar cantidad de vms"
read napps
echo "nombre del inventario"
read laboratorio

# clones vm, configures hostname and starts
for i in $(seq 1 $napps)
do

  vmNAME=minionapps$i
  echo "creando vm : $vmNAME"
  virt-clone --original Minionfedora30 --name $vmNAME --file $ruta/disc_$vmNAME.qcow2 --auto-clone
  virt-customize -c qemu:///system -d $vmNAME -hostname $vmNAME.$laboratorio
  virsh start $vmNAME
  
done
# run a scan to get arp table completed with new vms, and take a nap to avoid errors
nmap -sP 192.168.122.1/24
sleep 60

# ansible hosts creation and hosts file creation

echo [apps] >> inventario_$laboratorio
echo "#hostfile">> /etc/hosts
for i in $(seq 1 $napps)
do  
  vmNAME=minionapps$i  
  vmMAC=`virsh domiflist $vmNAME | grep vnet | awk '{print $5}'`
  vmIP=`ip neigh | grep -i $vmMAC | awk '{print $1}'`
  echo $vmNAME  ansible_host=$vmIP >>  inventario_$laboratorio
  echo -e $vmIP  \t\t $vmNAME >> /etc/hosts
  echo
done
