FROM icr.io/appcafe/open-liberty:kernel-slim-java11-openj9-ubi

ARG VERSION=1.0
ARG REVISION=SNAPSHOT

LABEL \
  org.opencontainers.image.authors="Satish Babu" \
  org.opencontainers.image.vendor="Open Liberty" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://github.com/OpenLiberty/guide-containerize" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="Open Liberty" \
  name="system" \
  version="$VERSION-$REVISION" \
  summary="A very simple OpenLiberty Image" \
  description="This image contains a simple index.html that says 'Hello World'"

COPY --chown=1001:0 src/main/liberty/config /config/

RUN features.sh

COPY --chown=1001:0 target/hello-ol-docker.war /config/apps

RUN configure.sh
