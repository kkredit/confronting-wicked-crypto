# Filename: Dockerfile
# Author: Kevin Kredit
# License: Creative Commons Zero v1.0 Universal
# Description:
#   Dockerfile to encapsulate the thesis build envrinment

# Image settings
FROM ubuntu:18.04

ARG USER_GID=1000
ARG USER_NAME=thesisbuilder

ENV DEBIAN_FRONTEND=noninteractive

# Basic setup
RUN \
    # Updates
    apt-get update                      && \
    apt-get upgrade -y                  && \
    # Group creation
    groupadd -g $USER_GID $USER_NAME    && \
    # Basic tools
    apt-get install -y \
        make \
        curl \
        wget

# Install LaTeX tools
RUN apt-get install -y \
        texlive-latex-extra \
        texlive-science \
        texlive-xetex \
        texlive-generic-extra \
        texlive-publishers \
        latexmk

# Install Argdown tools
# TODO: install node
RUN apt-get install -y \
        inkscape \
        libcanberra-gtk-module \
        libcanberra-gtk3-module
# RUN npm install -g @argdown/cli

# Install Drawio tools

# RUN apt-get install -y systemd dbus
# RUN apt-get install -y \
#         snapd
# RUN service snapd start
# RUN snap install drawio

RUN URL=$(curl -sL https://github.com/jgraph/drawio-desktop/releases/latest | \
                    grep "\.deb" | head -1  | cut -d\" -f2) && \
    wget -q $URL && \
    (dpkg -i ./*.deb || apt-get -fy install)
