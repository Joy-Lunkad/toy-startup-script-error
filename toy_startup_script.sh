#! /bin/bash
sleep 10 
cd /home/joylunkad/
sudo -u joylunkad bash -c '\
source /home/joylunkad/.bashrc && \
pip install "jax[tpu]>=0.2.16" -f https://storage.googleapis.com/jax-releases/libtpu_releases.html && \
git clone https://github.com/Joy-Lunkad/toy-startup-script-error.git && \
pip install wandb && \
python3 toy_control.py' 