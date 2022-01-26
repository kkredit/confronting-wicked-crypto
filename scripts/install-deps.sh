#!/bin/bash

# For Zotero container used in some helper scripts, must have Docker installed. Not covered here.

# Also see the Dockerfile for a self-contained build environment.

sudo apt-get install -y \
    make \
    curl \
    wget \
    git \
    apt-utils \
    texlive-latex-extra \
    texlive-science \
    texlive-xetex \
    texlive-publishers \
    latexmk \
    inkscape \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    npm

curl -sL https://deb.nodesource.com/setup_10.x | bash -
sudo apt-get install -y --no-install-recommends \
    nodejs
sudo npm install -g @argdown/cli

if which snap &>/dev/null; then
    snap install drawio
else
    URL=$(curl -sL https://github.com/jgraph/drawio-desktop/releases/latest | grep "\.deb" | head -1  | cut -d\" -f2)
    wget -q "$URL"
    sudo dpkg -i ./*.deb || sudo apt-get -fy install
    rm ./*.deb
fi
