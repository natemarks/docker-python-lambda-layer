.DEFAULT_GOAL := help

# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
DEFAULT_BRANCH := main
VERSION := 0.0.10
COMMIT := $(shell git rev-parse HEAD)
SHELL := $(shell which bash)
CDIR = $(shell pwd)


help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

docker-build: ## create docker image with commit tag
	( \
	   docker build --no-cache \
       	-t lambda-layer:$(COMMIT) \
       	-t lambda-layer:latest \
       	-f Dockerfile .; \
	)

clean-build: ## remove build directory
	sudo rm -rf build
	-sudo docker rm lambda-layer

docker-export: clean-build docker-build ## copy the layer contents to the build mount point
	( \
	   docker run -v $(CDIR)/build:/build --name lambda-layer lambda-layer; \
	   sudo chown -R $(shell id -u):$(shell id -g) build; \
	)

.PHONY: build static test
