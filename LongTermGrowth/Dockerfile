FROM nvidia/cuda:10.1-base-ubuntu18.04

ENV TIMEZONE America/Mexico_City
ENV JUPYTERLAB_VERSION 3.1.0
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEB_BUILD_DEPS="build-essential python3-dev python3-pip python3-setuptools software-properties-common libgit2-dev dirmngr libgmp3-dev libmpfr-dev"
ENV DEB_PACKAGES="sudo nano less time git curl wget htop graphviz gfortran libopenblas-dev"
ENV PIP_PACKAGES="numpy scipy matplotlib pandas seaborn sympy cvxpy cvxopt pytest dask distributed bokeh jupyter-book networkx ortools line_profiler memory_profiler psutil guppy3 cython numba graphviz"

RUN apt-get update && export $DEBIAN_FRONTEND && \
    echo $TIMEZONE > /etc/timezone && apt-get install -y tzdata

RUN apt-get update && apt-get install -y $DEB_BUILD_DEPS $DEB_PACKAGES && pip3 install --upgrade pip

WORKDIR /home/shared_volume

RUN groupadd LongTermGrowth
RUN useradd LongTermGrowth -g LongTermGrowth -m -s /bin/bash
RUN echo 'LongTermGrowth ALL=(ALL:ALL) NOPASSWD:ALL' | (EDITOR='tee -a' visudo)
RUN echo 'LongTermGrowth:qwerty' | chpasswd
RUN pip3 install jupyter jupyterlab==$JUPYTERLAB_VERSION
USER LongTermGrowth

RUN jupyter notebook --generate-config && sed -i "s/# c.NotebookApp.password = .*/c.NotebookApp.password = u'sha1:115e429a919f:21911277af52f3e7a8b59380804140d9ef3e2380'/" ~/.jupyter/jupyter_notebook_config.py

RUN pip3 install $PIP_PACKAGES

# install blink
RUN pip3 install git+https://github.com/facebookresearch/BLINK

ENTRYPOINT ["/usr/local/bin/jupyter", "lab", "--ip=0.0.0.0","--no-browser", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''"]
