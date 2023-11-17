#To login into GitHub Container Registry use:
#Enter your Personal GitHub access tokens (classic) by command: read -s PAT
#Enter your GitHub username in GITHUB_USERNAME
#Login to GitHub Container Registry: echo $PAT | docker login ghcr.io -u your_github_username --password-stdin

APP=kbot
VERSION=v0.0.1
GOOS=$(shell go env GOOS)
GOARCH=$(shell go env GOARCH)
GITHUB_USERNAME=bslobodeniuk

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
	docker build . -t ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

push:
	docker push ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

clean-build:
	rm -rf kbot go.mod go.sum

clean-image:
	docker rmi -f ghcr.io/$(GITHUB_USERNAME)/${APP}:${VERSION}-$(GOARCH)

clean: clean-build clean-image

go: clean-build format init get
	CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -v -o kbot -ldflags "-X="github.com/$(GITHUB_USERNAME)/kbot/cmd.appVersion=${VERSION}

