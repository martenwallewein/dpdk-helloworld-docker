FROM ubuntu:20.10
ARG dpdkversion=v21.02
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install make build-essential git meson pkgconf -y
WORKDIR /tmp
RUN git clone https://github.com/DPDK/dpdk.git
WORKDIR /tmp/dpdk
RUN git checkout $dpdkversion
RUN apt-get install python3-pip -y
RUN pip3 install pyelftools
RUN meson build
RUN ls -lash
WORKDIR /tmp/dpdk/build
RUN meson configure -Dexamples=helloworld
RUN ninja
CMD /tmp/dpdk/build/examples/dpdk-helloworld -l 0-3 -n 4