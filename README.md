# Spring Boot + Docker + CFN sample

This is a simple application to demonstrate hooking up Spring Boot, Docker and CloudFormation. You can use it as a skeleton
for your own project, or just take some tricks away.

## Moving parts

* The Java Application (the groupId and artifactId are used throughout the docker files)
* `docker.sh` where most parameters are defined.

## Infrastructure you need

* **Regional artifact buckets (docker-REGION-artifacts)** - application versions for different regions are stored here
* **Global artifact bucket** + **.dockercfg in the root of that bucket** - Authenication to your Docker Registry

## Step-by-step Guide

TBD

## Contributors

[Patrick Stegmann](https://github.com/wonderb0lt), [Andreas Mohrhard](mailto:andreas.mohrhard@cosee.biz)
