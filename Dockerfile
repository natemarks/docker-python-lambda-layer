FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y python3.8 python3-pip python3.8-dev build-essential zip
RUN mkdir -p layer/python/lib/python3.8/site-packages
RUN mkdir -p build
RUN pip3 install requests -t layer/python/lib/python3.8/site-packages/
CMD zip -r layer.zip layer && chmod 666 layer.zip && mv layer.zip build/layer.zip