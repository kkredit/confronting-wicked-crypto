# Filename: Dockerfile
# Author: Kevin Kredit
# License: Creative Commons Zero v1.0 Universal
# Description:
#   Dockerfile to encapsulate the thesis build envrinment

# Image settings
FROM ubuntu:18.04

ARG USER_UID=1000
ARG USER_GID=1000
ARG USER_NAME=builder
ARG MNT_PNT=/host

ENV DEBIAN_FRONTEND=noninteractive


# Basic setup
RUN \
    # User setup
    groupadd -g $USER_GID $USER_NAME && \
    useradd --create-home -s /bin/bash -u $USER_UID -g $USER_GID $USER_NAME && \
    # Updates
    apt-get update && \
    apt-get upgrade -y && \
    # Basic tools
    apt-get install -y \
        make \
        curl \
        wget \
        git \
        apt-utils


# Install LaTeX tools
RUN apt-get install -y \
        texlive-latex-extra \
        texlive-science \
        texlive-xetex \
        texlive-generic-extra \
        texlive-publishers \
        latexmk


# Install Argdown tools
RUN apt-get install -y --no-install-recommends \
        inkscape \
        libcanberra-gtk-module \
        libcanberra-gtk3-module \
        npm
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y --no-install-recommends \
        nodejs && \
    npm install -g @argdown/cli


# Install Drawio tools
RUN URL=$(curl -sL https://github.com/jgraph/drawio-desktop/releases/latest | \
                    grep "\.deb" | head -1  | cut -d\" -f2) && \
    wget -q $URL && \
    (dpkg -i ./*.deb || apt-get -fy install)


# Setup the working directory
RUN mkdir -p $MNT_PNT
WORKDIR $MNT_PNT
