ORG=ucodkr
REPO=registry.gitlab.com 
BASE_IMAGE=debian:bullseye-slim
IMAGE_NAME=k8s_tf
VERSION=1.0.0
build:
	docker build . -t ${ORG}/${IMAGE_NAME}:${VERSION} \
	--build-arg BASE_IMAGE=${BASE_IMAGE}
	

bash:
	docker run --rm -it \
		-v ${PWD}:${PWD} \
		-v /var/run/docker.sock:/var/run/docker.sock \
		${ORG}/${IMAGE_NAME}:${VERSION}  bash

deploy:
	docker tag ${ORG}/${IMAGE_NAME}:${VERSION} ${ORG}/${IMAGE_NAME}:latest
	docker push ${ORG}/${IMAGE_NAME}:${VERSION} 
	docker push ${ORG}/${IMAGE_NAME}:latest

test:	
	docker run --rm -it \
		-v ${PWD}:${PWD} \
		${ORG}/${IMAGE_NAME}:${VERSION}  tf init