format:
	gofmt -s -w ./

build:
	go build -v -o kbot -ldflags "-X github.com/bslobodeniuk/kbot/cmd.appVersion=v1.0.0"