# lista las IPs entregadas por KVM y las parsea para entregar al archivo hosts con los nombres de las VMs y las IPs correspondientes. requiere la existencia del archivo y correr como root

virsh net-dhcp-leases default | grep ipv4 | awk '{print substr($5, 1, length($5)-3) "\t" $6}' >> /etc/hosts
