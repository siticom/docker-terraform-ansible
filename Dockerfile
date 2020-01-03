FROM centos:8

ARG TERRAFORM_VERSION="0.12.18"
ARG ANSIBLE_VERSION="2.9.2"

LABEL maintainer="Lukas Steiner <lukas.steiner@siticom.de>"
LABEL terraform_version=${TERRAFORM_VERSION}
LABEL ansible_version=${ANSIBLE_VERSION}

RUN dnf install -y unzip openssh-clients jq python3 python3-pip \
    && pip3 install ansible==${ANSIBLE_VERSION} awscli \
    && curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform*.zip \
    && mv terraform /usr/local/bin

ENV ANSIBLE_HOST_KEY_CHECKING="False"
