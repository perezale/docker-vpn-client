FROM alpine:latest
LABEL maintainer="James Z.M. Gao <gaozm55@gmail.com>"

ENV OC_VERSION=8.05

RUN set -ex \
# 1. install pptpclient
    && echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk --update --no-progress upgrade \
    && apk add --no-progress ca-certificates pptpclient@testing \
# 3. fix ip command location for the pptp client
    && ln -s "$(which ip)" /usr/sbin/ip \
# 4. cleanup
    && rm -rf /var/cache/apk/* /tmp/* ~/.gnupg

COPY content /

ENTRYPOINT ["/entrypoint.sh"]
