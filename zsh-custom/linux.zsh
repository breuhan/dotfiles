function smartmon-all {
    for disk in /dev/disk/by-id/ata-*; do
        echo "Disk $disk"
        sudo smartctl --all $disk | grep "Device Model"
    done
}
function identify-disks {
  i=0
  sleep 30
  for disk in /dev/disk/by-id/wwn-*; do
    echo "Flashing ${disk}"
    sudo dd if=${disk} of=/dev/null bs=4k count=10000
    sleep 3
  done
}
