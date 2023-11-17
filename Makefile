#To login into GitHub Container Registry use:
#Enter your Personal GitHub access tokens (classic) by command: read -s PAT
#Enter your GitHub username by command: read -s GITHUB_USERNAME
#Login to GitHub Container Registry: echo $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin

APP=$(shell basename $(shell git remote get-url origin))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
GOOS=$(shell go env GOOS)
GOARCH=$(shell go env GOARCH)

format:
	gofmt -s -w ./

lint:
	golang-lint run

test:
	go test -v

init: clean-build
	go mod init github.com/$(GITHUB_USERNAME)/kbot

get:
	go get

image:
	docker build --build-arg GITHUB_USERNAME=$(GITHUB_USERNAME) . -t ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

push:
	docker push ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

clean-build:
	rm -rf kbot go.mod go.sum

clean-image:
	docker rmi -f ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

clean: clean-build clean-image

build: clean-build format init get
	CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -v -o kbot -ldflags "-X="github.com/$(GITHUB_USERNAME)/kbot/cmd.appVersion=${VERSION}

