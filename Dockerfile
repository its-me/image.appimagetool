FROM alpine:latest

ARG APPIMAGETOOL_VERSION=continuous
ARG APPIMAGETOOL_SHA256
ARG TARGETARCH
ARG TARGETVARIANT

RUN set -o xtrace \
    && apk update \
    && apk add --no-cache fuse3 file curl \
    && rm -rf /var/cache/apk/*

RUN set -o xtrace \
    && ARCH="${TARGETARCH}${TARGETVARIANT:+/$TARGETVARIANT}" \
    && case $ARCH in \
        amd64) APPIMAGETOOL_ARCH=x86_64 ;; \
        arm64|arm64/v8) APPIMAGETOOL_ARCH=aarch64 ;; \
        arm/v7) APPIMAGETOOL_ARCH=armhf ;; \
        386) APPIMAGETOOL_ARCH=i686 ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac \
    && wget -O /usr/local/bin/appimagetool "https://github.com/AppImage/appimagetool/releases/download/${APPIMAGETOOL_VERSION}/appimagetool-${APPIMAGETOOL_ARCH}.AppImage" \
    && if [ -n "$APPIMAGETOOL_SHA256" ]; then \
        echo "${APPIMAGETOOL_SHA256}  /usr/local/bin/appimagetool" | sha256sum -c - ; \
    fi \
    && chmod +x /usr/local/bin/appimagetool
