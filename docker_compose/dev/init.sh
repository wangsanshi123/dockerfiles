#!/usr/bin/env bash
echo "======start========"
#echo $PATH
#PATH=$PATH:/root/miniconda3/bin
#echo $PATH
cd /home/root/space/yjsmf
source /root/miniconda3/bin/activate python1v3
#echo "pwd:$PWD"
#ls
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
echo "==========end=========="
