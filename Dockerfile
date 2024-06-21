# use Alpine for as small an image as possible
FROM alpine:3.17

# Define Hugo version
ENV HUGO_VERSION="0.101.0" \
    HUGO_TYPE="_extended"

RUN apk --no-cache add git libc6-compat libstdc++ && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo${HUGO_TYPE}_${HUGO_VERSION}_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz && \
    tar -xzf /tmp/hugo.tar.gz -C /tmp && \
    mv /tmp/hugo /usr/local/bin/ && \
    rm -rf /tmp/* && \
    mkdir -p /src && \
    hugo new site /src

VOLUME [ "/src" ]

WORKDIR /src

EXPOSE 1313

ENTRYPOINT ["hugo"]
