FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa -y && \
    apt-get update -y && \
    apt-get install -y python3.11 python3-pip python3.11-dev build-essential zip
RUN mkdir -p layer/python/lib/python3.11/site-packages
RUN mkdir -p build
RUN pip3 install requests -t layer/python/lib/python3.11/site-packages/
CMD zip -r layer.zip layer && chmod 666 layer.zip && mv layer.zip build/layer.zip