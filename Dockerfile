FROM alpine:3.10

LABEL maintainer="arisandy@gmail.com"

WORKDIR /opt

RUN apk --no-cache add wget 

# install glibc before install the ooklaserver daemon
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-bin-2.30-r0.apk \
    && apk add glibc-2.30-r0.apk glibc-bin-2.30-r0.apk \
    && rm glibc-2.30-r0.apk glibc-bin-2.30-r0.apk

# install ooklaserver daemon
RUN wget -c https://install.speedtest.net/ooklaserver/stable/OoklaServer-linux64.tgz -O - | tar -zx -C /opt \
    && mv /opt/OoklaServer.properties.default /opt/OoklaServer.properties \
    && sed -i '/\*.ookla.com, \*.speedtest.net/s/^#//g' /opt/OoklaServer.properties 

EXPOSE 5060
EXPOSE 8080

CMD /opt/OoklaServer