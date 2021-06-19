FROM rapidsai/rapidsai-core:0.19-cuda11.0-runtime-ubuntu20.04-py3.7

# Required packages to compile OpenCV: 
RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    cmake \
    git \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libopencv-dev \
    python-dev 

# Additional requirements
SHELL ["/bin/bash", "--login", "-c"] # Make RUN commands use `bash --login`:
COPY requirements.txt .
RUN conda activate rapids && \
    conda install -c quantopian ta-lib  && \
    conda install pip && \ 
    python -m pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install opencv-python

# 3ccAI user and PATH
RUN useradd -m 3ccAI && echo "3ccAI:3ccAI" | chpasswd && adduser 3ccAI sudo
USER 3ccAI
WORKDIR /home/3ccAI



