FROM bitnami/mediawiki:1-debian-10
USER root
RUN useradd -r -u 1001 -g root nonroot -d /home/nonroot/ -m &&  mkdir -p /var/lib/apt/lists/partial

#COPY ClipUpload /bitnami/mediawiki/extensions

RUN install_packages imagemagick
USER nonroot

