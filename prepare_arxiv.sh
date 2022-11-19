#!/bin/bash

set -eEuo pipefail

which arxiv_latex_cleaner &>/dev/null || pip3 install arxiv_latex_cleaner

arxiv_latex_cleaner . \
  --verbose \
  --keep_bib

DEST="../$(pwd | rev | cut -d/ -f1 | rev)_arXiv"
rm "$DEST"/{Dockerfile,LICENSE,Makefile,README.md}
