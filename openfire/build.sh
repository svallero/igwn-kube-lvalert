#!/bin/sh

IMAGE="svallero/igwn-openfire"
TAG="test"

docker build -t ${IMAGE}:${TAG} .

