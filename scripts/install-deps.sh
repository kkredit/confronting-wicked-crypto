#!/bin/bash

# For Bibtex scripts, must have Docker installed. Not covered here.
# This is not necessarily fully-inclusive.

sudo apt-get install -y \
    make \
    texlive-latex-extra \
    texlive-science \
    texlive-xetex \
    texlive-generic-extra \
    texlive-publishers \
    latexmk \
    inkscape \
    libcanberra-gtk-module \
    libcanberra-gtk3-module

snap install drawio
