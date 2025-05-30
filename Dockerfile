FROM ubuntu:20.04

RUN apt update && apt install -y git curl build-essential zlib1g-dev libssl-dev

RUN git clone https://github.com/TelegramMessenger/MTProxy.git /mtproxy && \
    cd /mtproxy && make

WORKDIR /mtproxy
EXPOSE 443

CMD ./objs/bin/mtproto-proxy -u nobody -p 443 -H 443 -S 0123456789abcdef0123456789abcdef --aes-pwd proxy-secret proxy-multi.conf -M 1
