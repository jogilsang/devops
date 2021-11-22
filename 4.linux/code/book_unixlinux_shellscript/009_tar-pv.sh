#!/bin/bash

# DATA_DIR=/myapp/datadir
DATA_DIR=./

cd $DATA_DIR
tar cf - README.md question.txt | pv | gzip > archive.tar.gz
