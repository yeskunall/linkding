ARG ALPINE_IMAGE_TAG=3.14
ARG LINKDING_IMAGE_TAG=latest
ARG LITESTREAM_VERSION=v0.3.11

FROM docker.io/alpine:$ALPINE_IMAGE_TAG as builder

ADD https://github.com/benbjohnson/litestream/releases/download/$LITESTREAM_VERSION/litestream-$LITESTREAM_VERSION-linux-amd64.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

FROM docker.io/sissbruecker/linkding:$LINKDING_IMAGE_TAG

COPY --from=builder /usr/local/bin/litestream /usr/local/bin/litestream

COPY etc/litestream.yml /etc/litestream.yml

# This allows to run with 256MB RAM. But for safety, I like to deploy to Fly with
# at least 512MB of RAM.
COPY uwsgi.ini /etc/linkding/uwsgi.ini

COPY scripts/run.sh /scripts/run.sh
RUN chmod +x /scripts/run.sh

# Let Litestream spawn linkding’s webserver as a subprocess
CMD ["/scripts/run.sh"]

