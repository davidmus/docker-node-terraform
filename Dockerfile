FROM node:13.10.1

ENV TF_VER 0.12.24

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip && \
  unzip terraform.zip && \
  rm -f terraform.zip

RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

CMD ["/bin/bash"]
