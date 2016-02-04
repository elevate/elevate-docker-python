#!/bin/bash
set -e
VERSION=$(cat conda-version)
IMAGE=docker-registry2.elevate.internal:5000/elevate-python
VERSIONED_IMAGE=${IMAGE}:${VERSION}
docker build -t $IMAGE .
docker tag -f $IMAGE $VERSIONED_IMAGE
docker push $VERSIONED_IMAGE
docker push $IMAGE
