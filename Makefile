MAINTAINER := olegbukatchuk
CONTAINER := ops-tools
VERSION := 0.0.6
COMPOSE := ${CONTAINER}.yaml
PORT := 8080
APP := ${CONTAINER}


.PHONY: compose build push up down tools clean

compose:
	export MAINTAINER=${MAINTAINER} \
				 CONTAINER=${CONTAINER} \
				 VERSION=${VERSION} \
				 PORT=${PORT}; \
				 rm -rf ${COMPOSE}; \
				 envsubst < "docker/template.yaml" > "docker/${COMPOSE}";

build:
	docker build \
		--build-arg VERSION=${VERSION} \
		--build-arg CONTAINER=${CONTAINER} \
		--tag ${MAINTAINER}/${CONTAINER}:${VERSION} docker/

push:
	docker push ${MAINTAINER}/${CONTAINER}:${VERSION}

up:
	MAINTAINER=${MAINTAINER} \
	CONTAINER=${CONTAINER} \
	VERSION=${VERSION} \
	docker-compose -f docker/${COMPOSE} up -d

down:
	MAINTAINER=${MAINTAINER} \
	CONTAINER=${CONTAINER} \
	VERSION=${VERSION} \
	docker-compose -f docker/${COMPOSE} down

tools:
	gcc -o ./bin/${APP} src/main.c

all:
	gcc -o ./bin/${APP} src/main.c
	./bin/${APP}

clean:
	rm -rf docker/bin
