
FROM ubuntu:18.04

LABEL maintaner="Rodrigo Cavalcante <rodrigoibka@gmail.com>"

RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

RUN apt-get update -qq && apt-get install -y -q --no-install-recommends \
    libgconf2-4 libnss3-dev libxss1 software-properties-common wget \
    fonts-liberation libappindicator1 xdg-utils \
    curl unzip wget build-essential \
    xvfb \
    apt-transport-https \
    libssl-dev \
    rsync \
    devscripts \
    autoconf \
    ssl-cert \
    make \
    libssl-dev \
    libreadline-dev \
    libffi-dev

#RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz && \
#tar -xvf Python-3.7.0.tgz && \
#cd Python-3.7.0 && \
#./configure --enable-optimizations && \
#make -j8 && \
#make install

#RUN wget wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz && \
#tar –xf Python-3.7.5.tgz && \
#./configure ––enable–optimizations && \
#make install
RUN add-apt-repository ppa:deadsnakes/ppa && \
apt update && apt install python3.7 -y

# update pip
RUN python -m pip install pip --upgrade && \
    python -m pip install wheel 


RUN pip3 install pyvirtualdisplay \
    virtualenv pipenv p4python pycrypto

#===========================
# Node & NPM LTS
#===========================
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

#define python3.7 as default
RUN rm -rfv /usr/bin/python && ln -s /usr/local/bin/python3.7 /usr/bin/python

#Clear cache
RUN rm -rf /var/lib/apt/lists/*
