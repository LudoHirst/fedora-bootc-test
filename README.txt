a rootless setup for fedora bootc.

install using:
sudo podman run --rm --privileged --pid=host --ipc=host \
    -v /dev:/dev \
    -v /var/lib/containers:/var/lib/containers \
    ghcr.io/ludohirst/fedora-bootc-test:latest \
    bootc install to-disk \
    --filesystem btrfs \
    /dev/sdx
