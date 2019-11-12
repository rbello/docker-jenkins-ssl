#! /bin/sh

docker kill sifi-jenkins
docker rm sifi-jenkins
docker rmi agl/jenkins
