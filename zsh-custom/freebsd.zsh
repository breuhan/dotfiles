function ports-update {
  # FETCH LATEST PORTS TREE
  sudo portsnap fetch update

  # CHECK WHAT NEW VERSIONS EXIST
  sudo portmaster -L --index-only | awk '/ [Nn]ew / { print substr($0,9,9999) }'

  # CHECK SECURITY ISSUES
  #sudo portaudit -Fda

  # CHECK /usr/ports/UPDATING MESSAGES
  pkg updating -d $( ls -ltr -D '%Y%m%d' /var/db/pkg | awk 'END{print $6}' )
}

function ports-upgrade {
  # UPDATE PACKAGES USING STABLE PATH ON FTP
  sudo portmaster -y --no-confirm --packages-if-newer -m 'BATCH=yes' -d -a

  # FIX DEPENDENCIES AS NEEDED
  sudo portmaster --check-depends
}

function ports-build {
  # REBUILD SINGLE, SEVERAL OR ALL PORTS
  case ${#} in
    (0) sudo portmaster -y --no-confirm --packages-if-newer -m 'BATCH=yes' -d -a ;;
    (*) sudo portmaster -y --no-confirm --packages-if-newer -m 'BATCH=yes' -d $@ ;;
  esac

  # FIX DEPENDENCIES AS NEEDED
  sudo portmaster --check-depends
}

function smartmon-all {
    for i in {0..10}; do
        echo "Disk ada$i" $SN $MD
        sudo smartctl --all /dev/ada$i | grep "Device Model"
    done
}
function identify-disks {
  i=0
  sleep 30
  while true
  do
    echo "Flashing ada${i}"
    sudo dd if=/dev/ada${i} of=/dev/null bs=4k count=10000
    ((i++))
    sleep 3
  done
}
