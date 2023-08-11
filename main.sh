sudo apt update && sudo apt install qemu qemu-system-x86 aria2 -y
aria2c -x16 -s16 -oDVD.iso https://archive.org/download/mini11-22h2/Mini11%20AIO%2022H2%20Beta%202%20Longhorn.iso
qemu-img create -f qcow2 disk.img 25G
qemu-system-x86_64 -m 10240 -hda disk.img -vnc 127.0.0.1:1 -boot c -usbdevice tablet -cdrom DVD.iso -netdev user,id=n1 -device e1000,netdev=n1 -enable-kvm & ./noVNC/utils/novnc_proxy --vnc localhost:5901 --listen 0.0.0.0:80
