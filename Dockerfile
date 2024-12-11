ARG TERRAFORM_VERSION
ARG TERRAGRUNT_VERSION

FROM hashicorp/terraform:${TERRAFORM_VERSION}

ARG TERRAGRUNT
ARG BOILERPLATE

RUN apk add --update --no-cache bash git openssh

RUN . /envfile  && echo $ARCH && \  
    TERRAGRUNT_URL="https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" && \
    wget -q "${TERRAGRUNT_URL}" -O /usr/local/bin/terragrunt && \
    chmod +x /usr/local/bin/terragrunt

WORKDIR /apps

ENTRYPOINT []