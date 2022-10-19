#! /bin/bash
sleep 10 
cd /home/joylunkad/
sudo -u joylunkad bash -c '\
source /home/joylunkad/.bashrc && \
pip install "jax[tpu]>=0.2.16" -f https://storage.googleapis.com/jax-releases/libtpu_releases.html && \
git clone https://github.com/Joy-Lunkad/toy-startup-script-error.git && \
pip install wandb && \
cd toy-startup-script-error && \
python3 toy_control.py' 

# gcloud compute tpus tpu-vm create node-1 --zone=us-central1-f --accelerator-type=v2-8 --version=tpu-vm-base --preemptible --metadata-from-file=startup-script=toy_startup_script.sh

# gcloud compute tpus tpu-vm ssh node-1  --zone us-central1-f

# cat /var/log/syslog | grep startup-script