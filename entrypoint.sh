#!/bin/sh
apt-get install -y linux-headers-$(uname -r)
ebpf_exporter --config.file=/etc/config/ebpf-config.yaml
