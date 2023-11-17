APP=$(shell basename $(shell git remote get-url origin))
REGISTRY=bslobodenuk
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
GOOS=$(shell go env GOOS)
GOARCH=$(shell go env GOARCH)

format:
	gofmt -s -w ./

lint:
	golang-lint run

test:
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -v -o kbot -ldflags "-X="github.com/bslobodeniuk/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-$(GOARCH)

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-$(GOARCH)
clean:
	rm -rf kbot