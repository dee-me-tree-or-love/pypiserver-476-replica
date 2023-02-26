TEST_USER_NAME=test-user-1
DOCKER_IMAGE_TAG=pypi-repro

# Running setup in Docker
# ~~~~~~~~~~~~~~~~~~~~~~~

docker-setup/.htpasswd:
	htpasswd -sc ./docker-setup/.htpasswd ${TEST_USER_NAME}

.PHONY: build-docker
build-docker: docker-setup/Dockerfile docker-setup/.htpasswd
	docker build ./docker-setup -t ${DOCKER_IMAGE_TAG} 

.PHONY: run-docker
run-docker: build-docker
	docker run --rm -it -p 8080:8080 ${DOCKER_IMAGE_TAG}

# Running setup in Vagrant VM
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~

vagrant-setup/.htpasswd:
	htpasswd -sc ./vagrant-setup/.htpasswd ${TEST_USER_NAME}

.PHONY: start-vagrant
start-vagrant: vagrant-setup/.htpasswd
	VAGRANT_CWD=./vagrant-setup vagrant up

.PHONY: destroy-vagrant
destroy-vagrant: VAGRANT_CWD=./vagrant-setup
	VAGRANT_CWD=./vagrant-setup vagrant destroy