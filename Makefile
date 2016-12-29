REGISTRY ?= quay.io/
IMAGE_PREFIX ?= jgmize
IMAGE_NAME ?= spacemacs-tmux
VERSION ?= latest
IMAGE ?= ${REGISTRY}${IMAGE_PREFIX}/${IMAGE_NAME}\:${VERSION}


build:
	docker build -t ${IMAGE} .

home:
	docker run -itv $$HOME:/home/spacemacs/home ${IMAGE}

dotfiles:
	docker run -itv -v $(shell pwd)/dotfiles:/home/spacemacs/dotfiles ${IMAGE}

spacemacs:
	docker run -itv -v $(shell pwd)/spacemacs:/home/spacemacs/spacemacs ${IMAGE}

dev:
	docker run -itv $$HOME:/home/spacemacs/home \
							 -v $$HOME/.ssh:/home/spacemacs/.ssh \
               -v $$HOME/.gitconfig:/home/spacemacs/.gitconfig \
	quay.io/jgmize/spacemacs-tmux

.PHONY: dotfiles spacemacs
