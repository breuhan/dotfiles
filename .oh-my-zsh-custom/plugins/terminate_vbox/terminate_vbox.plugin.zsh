function terminate_vbox {
    VBoxManage list vms \
        | grep $(basename $(pwd)) \
        | cut -d' ' -f1 \
        | xargs -I '{}' VBoxManage controlvm '{}' poweroff 2> /dev/null
}
