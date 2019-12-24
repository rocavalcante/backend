
FROM python:3.7-stretch
#FROM ubuntu:16.04

LABEL maintaner="Rodrigo Cavalcante <rodrigoibka@gmail.com>"

RUN export LC_ALL=C.UTF-8
RUN export LANG=C.UTF-8

#============================
# Python & Dependencies
#============================

# RUN apt-get update -qq &&\
#     apt-get install -y software-properties-common wget

# RUN wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz && \
# tar -xvf Python-3.6.3.tgz && \
# cd Python-3.6.3 && \
# ./configure --enable-optimizations && \
# make -j8 && \
# make install

# RUN apt-get update -qq && \
#         apt-get install -y python-software-properties build-essential 

# define python3.6 as default
#RUN rm /usr/bin/python && ln -s /usr/bin/python3.6 /usr/bin/python

# update pip
RUN python3.7 -m pip install pip --upgrade && \
    python3.7 -m pip install wheel 

RUN apt-get update -qq && apt-get install -y -q --no-install-recommends \
    libgconf2-4 libxss1 \
    fonts-liberation libappindicator1 xdg-utils \
    curl unzip wget \
    xvfb \
    apt-transport-https \
    libssl-dev \
    rsync \
    devscripts \
    autoconf \
    ssl-cert

#============================
# Selenium & virtualenv
#============================

RUN pip3 install selenium pyvirtualdisplay \
    virtualenv pipenv p4python

#===========================
# Node & NPM LTS
#===========================
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

