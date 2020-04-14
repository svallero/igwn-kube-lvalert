#!/bin/sh

IMAGE="svallero/igwn-openfire"
TAG="persist"

docker build -t ${IMAGE}:${TAG} .

docker push ${IMAGE}:${TAG}
