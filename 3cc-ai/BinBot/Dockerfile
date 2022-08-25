FROM nvidia/cuda:11.4.0-devel-ubuntu20.04

ENV TIMEZONE America/Mexico_City
ENV JUPYTERLAB_VERSION 3.4.3
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEB_BUILD_DEPS="build-essential python3-dev python3-pip python3-setuptools software-properties-common"
ENV DEB_PACKAGES="sudo nano less time git curl wget htop graphviz gfortran libopenblas-dev"

RUN apt-get update && export $DEBIAN_FRONTEND && \
    echo $TIMEZONE > /etc/timezone && apt-get install -y tzdata

RUN apt-get update && apt-get upgrade -y && apt-get autoremove
RUN apt-get install -y $DEB_BUILD_DEPS $DEB_PACKAGES && pip3 install --upgrade pip

RUN groupadd 3cc_binbot
RUN useradd 3cc_binbot -g 3cc_binbot -m -s /bin/bash
RUN echo '3cc_binbot ALL=(ALL:ALL) NOPASSWD:ALL' | (EDITOR='tee -a' visudo)
RUN echo '3cc_binbot:qwerty' | chpasswd
RUN pip3 install jupyter jupyterlab==$JUPYTERLAB_VERSION
USER 3cc_binbot

RUN jupyter notebook --generate-config && sed -i "s/# c.NotebookApp.password = .*/c.NotebookApp.password = u'sha1:115e429a919f:21911277af52f3e7a8b59380804140d9ef3e2380'/" ~/.jupyter/jupyter_notebook_config.py
RUN cp ~/.jupyter/jupyter_notebook_config.py ~/.jupyter/jupyter_server_config.py

COPY requirements.txt ./
RUN pip3 install -r requirements.txt

WORKDIR /home/shared_volume