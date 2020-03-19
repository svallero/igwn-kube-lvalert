#!/bin/sh

IMAGE="svallero/igwn-lvalert-cli"
TAG="test"

docker build -t ${IMAGE}:${TAG} .

docker push ${IMAGE}:${TAG}

