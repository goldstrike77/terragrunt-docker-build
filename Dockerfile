ARG TERRAFORM_VERSION

FROM hashicorp/terraform:${TERRAFORM_VERSION}

ARG TERRAGRUNT_VERSION

RUN apk add --update --no-cache bash git openssh ca-certificates jq

RUN wget -q "https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64" -O /usr/local/bin/terragrunt && chmod +x /usr/local/bin/terragrunt

WORKDIR /

COPY gitlab-terraform.sh /usr/bin/gitlab-terraform
RUN chmod +x /usr/bin/gitlab-terraform

ENTRYPOINT []
