FROM node:latest

ENV TERRAFORM_VERSION 0.12.24

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform.zip -d /usr/local/bin && \
  rm -f terraform.zip

RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

RUN apt-get update && \
  apt-get --assume-yes install jq && \
  apt-get --assume-yes install default-jdk && \
  apt install docker.io && \
  apt-get --assume-yes install python2.7 && \
  apt-get --assume-yes install awscli

CMD ["/bin/bash"]
