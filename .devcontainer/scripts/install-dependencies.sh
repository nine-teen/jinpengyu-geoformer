#!/bin/bash

set -e

cd /home/usr/app
python3 -m venv .venv
source .venv/bin/activate

pip install -r requirements.txt

cd /home/usr/app/src/pointnet2_ops_lib
python3 setup.py install

cd /home/usr/app/src/metrics/CD/chamfer3D
python3 setup.py install
