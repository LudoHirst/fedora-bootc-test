#!/bin/bash
set -ouex pipefail

# remove softwares
dnf remove -y \
    fedora-third-party firefox gnome-software-rpm-ostree gnome-initial-setup fedora-flathub-remote \
    google-noto-sans-cjk-vf-fonts default-fonts-cjk-sans

# add rpmfusion
dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## get ride of fedora flatpaks
#mv -f /usr/lib/systemd/system/flatpak-delete-fedora-repos.service /usr/lib/systemd/system/flatpak-add-fedora-repos.service

# swap and install
dnf swap -y --allowerasing ffmpeg-free ffmpeg
dnf install -y --skip-unavailable \
    intel-media-driver openh264 intel-gpu-tools just vim-enhanced flatpak-spawn fzf lshw htop \
    chromium adw-gtk3-theme gnome-tweaks google-noto-sans-balinese-fonts google-noto-sans-cjk-fonts \
    google-noto-sans-javanese-fonts google-noto-sans-sundanese-fonts google-go-mono-fonts \
    google-tinos-fonts google-arimo-fonts google-carlito-fonts google-cousine-fonts \
    google-crosextra-caladea-fonts
