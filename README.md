# toy-startup-script-error
A toy example to show how jax cannot initialize tpus only if the program is executed by a startup-script

# To recreate the error
1. On the cloud shell terminal run
```bash
git clone https://github.com/Joy-Lunkad/toy-startup-script-error.git
cd toy-startup-script-error
gcloud compute tpus tpu-vm create node-1 --zone=us-central1-f --accelerator-type=v2-8 --version=tpu-vm-base \
--preemptible --metadata-from-file=startup-script=toy_startup_script.sh
gcloud compute tpus tpu-vm ssh node-1  --zone us-central1-f
```

2. Wait for sometime for the startup-script to execute and then run
```bash
cat /var/log/syslog | grep startup-script
```

3. You will find that the program runs into:
```
RuntimeError: Unable to initialize backend 'tpu': FAILED_PRECONDITION: Couldn't mmap: Resource temporarily unavailable.; Unable to create DeviceInfo, config: device_path: #011 "/dev/accel0" mode: KERNEL debug_data_directory: "" dump_anomalies_only: true crash_in_debug_dump: false allow_core_dump: true; could not create driver instance (set JAX_PLATFORMS='' to automatically choose an available backend)
```
