
#!/bin/bash

# toma de variables

echo "ingresar cantidad de vms"
read napps
echo "nombre del inventario"
read laboratorio



# creacion de variables

ruta=/var/lib/libvirt/images/
#modificar golden image Minionfedora30
for i in $(seq 1 $napps)
do

  vmNAME=minionapps$i
  echo "creando vm : $vmNAME"
  virt-clone --original Minionfedora30 --name $vmNAME --file $ruta/disc_$vmNAME.qcow2 --auto-clone
  virt-customize -c qemu:///system -d $vmNAME -hostname $vmNAME.$laboratorio
  virsh start $vmNAME
  
done
nmap -sP 192.168.122.1/24
sleep 60

# creación de inventario ansible y archivo hosts

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
