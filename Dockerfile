FROM centos:7

ARG TERRAFORM_VERSION="0.12.13"
ARG ANSIBLE_VERSION="2.8.5-1.el7"

LABEL maintainer="Lukas Steiner <lukas.steiner@siticom.de>"
LABEL terraform_version=${TERRAFORM_VERSION}
LABEL ansible_version=${ANSIBLE_VERSION}

RUN yum install -y epel-release unzip \
    && yum install -y awscli openssh-clients jq ansible-${ANSIBLE_VERSION} \
    && curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform*.zip \
    && mv terraform /usr/local/bin

ENV ANSIBLE_HOST_KEY_CHECKING="False"
