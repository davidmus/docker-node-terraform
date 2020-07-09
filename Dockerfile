FROM node:latest

ENV TERRAFORM_VERSION 0.12.24

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

RUN apt-get install -y build-essential python3 python3-venv curl unzip golang git openssh-server python3-pip jq cloud-utils zsh vim

RUN apt-get update && \
  apt-get --assume-yes install default-jdk && \
  apt-get --assume-yes install awscli

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

CMD ["/bin/bash"]
