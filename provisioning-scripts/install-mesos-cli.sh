#!/usr/bin/env bash

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
rm -f get-pip.py

pip install mesos.cli
