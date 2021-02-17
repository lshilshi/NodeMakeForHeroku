FROM alpine:3.12
LABEL maintainer "admin@nange.cn"
# build minimized
WORKDIR /
RUN apk add curl && \
    curl -LO https://github.com/tindy2013/subconverter/releases/latest/download/subconverter_linux64.tar.gz && \
    tar xvf subconverter_linux64.tar.gz && \
    rm subconverter_linux64.tar.gz && \
    cd subconverter && \
    mv subconverter /usr/bin
# set entry
WORKDIR /subconverter    
COPY profiles/ /subconverter/
CMD subconverter
