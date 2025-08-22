FROM continuumio/miniconda3:25.3.1-1
ENV VERSION=3.13.5
ENV TOOL=python
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update --allow-releaseinfo-change && apt install -y procps wget gzip pigz bc && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --remove channels defaults && \
	conda config --add channels bioconda && \
	conda config --add channels conda-forge && conda config --show channels

RUN conda install $TOOL=$VERSION && conda clean -a
