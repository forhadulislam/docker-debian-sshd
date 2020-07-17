PROJECT_TITLE := docker_debian_ssh
CONTAINERS := $(shell docker ps -aq)

.PHONY: stop-all-containers
stop-all-containers:
ifneq (${CONTAINERS},)
	docker stop ${CONTAINERS}
endif

.PHONY: build-debian-ssh
build-debian-ssh:
	docker build \
         --file ./Dockerfile \
         --rm=false \
         --tag ${PROJECT_TITLE} \
         .