#!/bin/bash
set -e

# Main configuration for docker run. In addition to this, you need to pass "VERSION" as an environment variable.

if [ -z $VERSION ]; then
    echo "*** You need to pass VERSION as an environment variable ***"
    exit 1
fi

REGISTRY="some-docker-registry.elasticbeanstalk.com"
APP_NAME="spring-boot-docker-cfn-sample"
DESCRIPTION="Spring Boot + Docker + CloudFormation sample"
CONTEXT="Dockerfile"
MAVEN_ARTIFACT="lt.wonderb0.example:spring-boot-docker-cfn-sample"
REGIONS="us-east-1 eu-west-1"

source "docker/common.sh"
main "$@"
