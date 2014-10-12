# Spring Boot + Docker + CFN sample

This is a simple application to demonstrate hooking up Spring Boot, Docker and CloudFormation. You can use it as a skeleton
for your own project, or just take some tricks away.

## Moving parts

* The Java Application (the groupId and artifactId from [pom.xml](https://github.com/wonderb0lt/spring-boot-docker-cfn-sample/blob/master/pom.xml) are used throughout the docker files)
* [docker.sh](https://github.com/wonderb0lt/spring-boot-docker-cfn-sample/blob/master/docker.sh) where most parameters are defined.
* [Your CloudFormation template](https://github.com/wonderb0lt/spring-boot-docker-cfn-sample/blob/master/cfn/spring-boot-docker-cfn-sample.cfn.json)

## Infrastructure you need

* **Regional artifact buckets (docker-REGION-artifacts)** - application versions for different regions are stored here
* **Global artifact bucket** + **.dockercfg in the root of that bucket** - Authenication to your Docker Registry

## Step-by-step Guide

Given you want to create or update a stack with the software version x.y.z:

1. Install your Spring Boot application into your Maven repo (make sure the version in your pom.xml is up-to-date)
2. Run `VERSION=x.y.z ./docker.sh` with the version you want to publish
3. After completion, create or update your stack, like so: `aws cloudformation create-stack --output text --stack-name $STACK-NAME --template-body spring-boot-docker-cfn-sample.cfn.json --parameters --parameters "ParameterKey=Version,ParameterValue=x.y.z"`
4. Profit!

## Possible optimizations

* Not having to enter your software version in every shell command, it's error-prone
* Having less buckets to create for saving the docker files

### TODOs

* Provide a CFN template to create the docker buckets themselves.

## Contributors

[Patrick Stegmann](https://github.com/wonderb0lt), [Andreas Mohrhard](mailto:andreas.mohrhard@cosee.biz)
