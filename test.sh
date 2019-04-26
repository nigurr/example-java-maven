#!/bin/sh

echo "********** Building docker image ***********"
docker build -t mvnsample ./

echo "********** Copying Coverage report ***********"
CID=$(docker run -d mvnsample)
docker cp $CID:/target/site/jacoco/jacoco.xml ./
docker stop $CID

