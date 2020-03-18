#!/bin/bash

GIT_TOKEN=$GIT_TOKEN
PORT=$PORT
HEALTH_PATH=$HEALTH_PATH
JAVA_APP=$IS_JAVA_APP
ACTION=$ACTION
ENVIRONMENT=$ENVIRONMENT
SERVICE_NAME=$SERVICE_NAME
ECR_REPO_LIST=$ECR_REPO_LIST


curl -X GET -H "Authorization: Bearer $GIT_TOKEN" \
    -L https://github.com/Picpay/picpay-ops-microsservices/tarball/master > picpay-ops-microservices.tar.gz




tar -xzvf picpay-ops-microservices.tar.gz
cd PicPay-picpay-ops-microservices*

docker run -it --rm \
        -e GIT_TOKEN=$GIT_TOKEN \
        -e JAVA_APP=$IS_JAVA_APP \
        -e PORT=$PORT \
        -e HEALTH_PATH=$HEALTH_PATH \
        -e INGRESS="internal-microservices" \
        -v "$(pwd):/aws/picpay-ops-microsservices/" \
        gmoulindan/aws-cli-jinja2 \
        $ACTION $ENVIRONMENT $SERVICE_NAME $ECR_REPO_LIST



