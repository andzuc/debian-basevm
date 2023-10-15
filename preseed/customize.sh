#!/bin/sh
# credit https://stackoverflow.com/a/246128
MYDIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &>/dev/null && pwd)
export PATH="$PATH:$MYDIR"
cd "$MYDIR"


DEBIAN_OS_VERSION="$(cat /etc/debian_version)"
echo DEBIAN_OS_VERSION="${DEBIAN_OS_VERSION}a"
od -t x1 /etc/debian_version

# https://www.engineyard.com/blog/building-a-vagrant-box-from-start-to-finish/
# no password for vagrant user sudo
echo "vagrant ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers.d/vagrant

sshsetup.sh \
    /home/vagrant \
    "$(cat vagrant.pub)" \
    vagrant vagrant
