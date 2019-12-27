
FROM ubuntu:16.04

LABEL maintaner="Rodrigo Cavalcante <rodrigoibka@gmail.com>"

RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

RUN apt-get update -qq && apt-get install -y -q --no-install-recommends \
    libgconf2-4 libnss3-1d libxss1 software-properties-common wget \
    fonts-liberation libappindicator1 xdg-utils \
    curl unzip wget build-essential \
    xvfb \
    apt-transport-https \
    libssl-dev \
    rsync \
    devscripts \
    autoconf \
    ssl-cert

RUN wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz && \
tar -xvf Python-3.6.8.tgz && \
cd Python-3.6.8 && \
./configure --enable-optimizations && \
make -j8 && \
make install

# update pip
RUN python3.6 -m pip install pip --upgrade && \
    python3.6 -m pip install wheel 


RUN pip3 install selenium pyvirtualdisplay \
    virtualenv pipenv p4python pycrypto

#===========================
# Node & NPM LTS
#===========================
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

#define python3.6 as default
RUN rm -rfv /usr/bin/python && ln -s /usr/local/bin/python3.6 /usr/bin/python

#Clear cache
RUN rm -rf /var/lib/apt/lists/*
