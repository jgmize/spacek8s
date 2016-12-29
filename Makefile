REGISTRY ?= quay.io/
IMAGE_PREFIX ?= jgmize
IMAGE_NAME ?= spacemacs-tmux
VERSION ?= latest
IMAGE ?= ${REGISTRY}${IMAGE_PREFIX}/${IMAGE_NAME}\:${VERSION}


build:
	docker build -t ${IMAGE} .

home:
	docker run -itv $$HOME:/home/spacemacs/home ${IMAGE}

dev:
	docker run -itv $$HOME:/home/spacemacs/home \
		-v $$HOME/dotfiles:/home/spacemacs/dotfiles \
		-v $$HOME/.ssh:/home/spacemacs/.ssh \
	  -v $$HOME/.gitconfig:/home/spacemacs/.gitconfig \
	  ${IMAGE}

.PHONY: dotfiles spacemacs
