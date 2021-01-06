FROM debian:buster

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y net-tools unzip zip xz-utils nano vim \
 && apt install -y build-essential pkg-config cmake \
 && apt install -y autoconf automake libtool \
 && apt install -y ca-certificates curl \
 && apt install -y subversion git

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/java && ./install-java.sh

RUN cd /tmp/java && ./install-ant.sh

RUN cd /tmp/java && ./install-maven.sh

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
