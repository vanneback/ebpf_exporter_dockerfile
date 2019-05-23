Builds a docker image capable of running the ebpf exporter tools on ubuntu nodes.
The image has been tested on `Ubuntu 18.04 LTS, bionic`.

## Requirements
* A config file must be mounted to `/etc/config/ebpf-config.yaml`
* `/sys/kernel/debug` and `/lib/modules` will also need to be mounted from the
host

 ## Docker image
 A image is available at https://cloud.docker.com/u/vanneback/repository/docker/vanneback/ebpf-exporter
