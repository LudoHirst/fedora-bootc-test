#!/bin/bash
set -ouex pipefail

mkdir -p /usr/lib/systemd/system/multi-user.target.wants
mkdir -p /usr/lib/systemd/system/timers.target.wants

ln -sf /usr/lib/systemd/system/systemd-homed.service \
       /usr/lib/systemd/system/multi-user.target.wants/systemd-homed.service

ln -sf /usr/lib/systemd/system/bootc-fetch-apply-updates.timer \
       /usr/lib/systemd/system/timers.target.wants/bootc-fetch-apply-updates.timer

ln -sf /usr/lib/systemd/system/systemd-homed-firstboot.service \
       /usr/lib/systemd/system/multi-user.target.wants/systemd-homed-firstboot.service

ln -sf /usr/lib/systemd/system/podman-subids.service \
       /usr/lib/systemd/system/multi-user.target.wants/podman-subids.service

authselect enable-feature with-systemd-homed
authselect select sssd with-systemd-homed --force
authselect apply-changes

dnf clean all
