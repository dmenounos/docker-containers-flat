FROM debian:buster

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y net-tools unzip zip xz-utils nano vim

# Install program files

COPY ./cont/tmp /tmp
COPY ./cont/entrypoint.sh /

RUN cd /tmp/java && ./install.sh -y

# What to run on container initiallization

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
