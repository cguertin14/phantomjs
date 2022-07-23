FROM ubuntu:20.04

# install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install build-essential g++ flex bison gperf ruby perl \
  libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
  libpng-dev libjpeg-dev python libx11-dev libxext-dev -y

# compile it
RUN git clone https://github.com/ariya/phantomjs.git && \
    cd phantomjs && \
    git checkout 2.1.1 && \
    git submodule init && \
    git submodule update
RUN cd phantomjs && python build.py