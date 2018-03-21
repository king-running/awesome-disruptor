#!/usr/bin/env bash

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

pip install pandas
python -m pip install matplotlib
pip install -U ggplot
#pip install blaze
#pip install bokeh
