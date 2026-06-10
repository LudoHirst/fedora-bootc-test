#!/bin/bash
set -ouex pipefail

# symlink os release file
mkdir -p /usr/etc
ln -sf ../usr/lib/os-release /usr/etc/os-release

# generate the initramfs
KERNEL_VERSION="$(rpm -q --queryformat="%{evr}.%{arch}" kernel-core)"
export DRACUT_NO_XATTR=1

dracut --no-hostonly --kver "${KERNEL_VERSION}" --reproducible \
  --add "ostree" \
  -f "/usr/lib/modules/${KERNEL_VERSION}/initramfs.img"
  
chmod 0600 "/usr/lib/modules/${KERNEL_VERSION}/initramfs.img"
