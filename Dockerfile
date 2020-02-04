FROM python:3.6-alpine3.10

ARG AWS_CLI_VERSION="1.16.280"

ENV AWS_CLI_VERSION=${AWS_CLI_VERSION}
RUN apk -uv add --no-cache \
        bash \
        groff \
        jq \
        curl \
        less \
        git \
    && pip install --no-cache-dir \
        awscli==$AWS_CLI_VERSION \
        jinja2-cli

WORKDIR /aws/picpay-ops-microsservices

ENTRYPOINT ["/aws/picpay-ops-microsservices/auto-ms-files/auto-ms-shell"]