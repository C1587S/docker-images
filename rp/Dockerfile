FROM ubuntu:20.04

ENV TIMEZONE America/Mexico_City
ENV JUPYTERLAB_VERSION 3.0.16
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEB_BUILD_DEPS="python3-dev python3-pip python3-setuptools software-properties-common"
ENV DEB_PACKAGES="sudo nano less git nodejs curl wget htop"

RUN apt update && export $DEBIAN_FRONTEND && \
    echo $TIMEZONE > /etc/timezone && apt install -y tzdata

RUN apt update && apt install -y $DEB_BUILD_DEPS $DEB_PACKAGES && \
    pip3 install --upgrade pip
    
WORKDIR /home/shared_volume

RUN useradd -m sebastian && echo "sebastian:sebastian" | chpasswd && adduser sebastian sudo
RUN pip3 install jupyter jupyterlab==$JUPYTERLAB_VERSION
RUN jupyter notebook --generate-config
RUN echo "c.NotebookApp.password='sha1:***'">>/root/.jupyter/jupyter_notebook_config.py
RUN pip3 install jupytext
RUN pip3 install "apache-airflow-providers-google" --upgrade --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-master/constraints-3.7.txt"
COPY requirements.txt .
RUN pip3 install -r requirements.txt
USER sebastian

CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''"]
# ENTRYPOINT ["/bin/bash"]