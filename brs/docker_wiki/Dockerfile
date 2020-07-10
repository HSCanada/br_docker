FROM bitnami/mediawiki:1-debian-10
USER root
RUN useradd -r -u 1001 -g root nonroot -d /home/nonroot/ -m
RUN mkdir -p /var/lib/apt/lists/partial
RUN install_packages imagemagick
USER nonroot

