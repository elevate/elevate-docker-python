cd "$(dirname "$0")"

VERSION=$(cat ../conda-version)
IMAGE=docker-registry2.elevate.direct:5000/elevate-python
VERSIONED_IMAGE=${IMAGE}:${VERSION}
docker build -t $IMAGE ..
docker tag  $IMAGE $VERSIONED_IMAGE
docker push $VERSIONED_IMAGE
docker push $IMAGE
