FROM quay.io/fedora/fedora-silverblue:44

# copy our scripts and static files into the container
COPY build_files /build_files
COPY sys_files /

# run the build scripts
RUN /build_files/packages.sh && \
    /build_files/initramfs.sh && \
    /build_files/post-install.sh \
    rm -rf /build_files
