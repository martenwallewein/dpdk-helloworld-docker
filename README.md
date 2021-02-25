# dpdk-helloworld-docker
Dockerfile that builds dpdk-helloworld example

## Requirements
- Setup Hugepages: https://wiki.archlinux.org/index.php/KVM#Enabling_huge_pages

## Building:
`docker build -t dpdk-docker-helloworld . `

## Running:
`docker run --rm -it --privileged -v /sys/bus/pci/devices:/sys/bus/pci/devices -v /sys/kernel/mm/hugepages:/sys/kernel/mm/hugepages -v /sys/devices/system/node:/sys/devices/system/node -v /dev:/dev -v /mnt/huge:/mnt/huge --name dpdk-docker dpdk-docker-helloworld:latest`

