#!/bin/sh
set -e
set -x
# This file was originally written by Andreas Mohrhard and used with permission.

copy_context() {
	echo "Copying context..."

	for f in $CONTEXT; do
		if [ ! -f $f ]; then
			echo "$f does not exist. Terminating"
			exit 2
		else
			cp $f .docker-ctx/
		fi
	done

	cp Dockerfile .docker-ctx
	mvn -U -q org.apache.maven.plugins:maven-dependency-plugin:2.8:copy -Dartifact=$MAVEN_ARTIFACT:$VERSION -DoutputDirectory=.docker-ctx/ -Dmdep.stripVersion=true
}

create_eb_archive() {
	# patch Dockerrun.aws.json to contain current tag
	# package Dockerrun and .ebextensions into zip, name with version in mind and upload to eb buckets

	cd build


	if [ -d "../.ebextensions" ]; then
		cp -r ../.ebextensions .
		ADDITIONAL_FILES=".ebextensions"
	fi

	sed -e "s/$APP_NAME:latest/$APP_NAME:$VERSION/" ../Dockerrun.aws.json > Dockerrun.aws.json

	zip -r $APP_NAME-$VERSION.zip Dockerrun.aws.json $ADDITIONAL_FILES

	cd ..


	for region in $REGIONS; do
		aws --region $region s3 cp build/$APP_NAME-$VERSION.zip s3://bol-$region-artifacts/$APP_NAME/

		sleep 1

		APPLICATIONS=`aws --region $region --output text elasticbeanstalk describe-applications --application-names $APP_NAME`

		if [ -z "$APPLICATIONS" ]; then
			aws --region $region elasticbeanstalk create-application --application-name $APP_NAME --description "$DESCRIPTION"
		fi
	done
}



cleanup() {
	rm -Rf build && mkdir -p build
	rm -Rf .docker-ctx && mkdir -p .docker-ctx
}

main() {
	cleanup
	copy_context

	docker build -t $REGISTRY/$APP_NAME:$VERSION .docker-ctx
	docker push $REGISTRY/$APP_NAME:$VERSION

	create_eb_archive

	echo EB_VERSION=$VERSION > build/docker.properties

	exit $?
}



