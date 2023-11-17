### kbot - telegram bot for Kubernetes


### Requirements:
0. Install golang: https://go.dev/dl/
```sh
brew install go
```
1. To run kbot on your environment:
- Register telegram bot with the BotFather and get token.
- Set env variable TELE_TOKEN with your token:
```sh
read -s TELE_TOKEN 
```



2. Login into GitHub Container Registry:

-  Set environment variable for your Personal GitHub access tokens (classic) by commands: 
```sh
read -s PAT
```

- Set environment variable for your GitHub username by commands:
```sh
read GITHUB_USERNAME
```

- Login to GitHub Container Registry: 
```sh
echo $PAT | docker login ghcr.io -u $GITHUB_USERNAME --password-stdin
```

1. Use make command to build, test, push and clean up:
```agsl
- make build : build kbot binary
- make test : run tests
- make image : build docker image
- make push : push docker image to your GitHub registry
- make clean : clean up binary file, docker image and modules
```

3. Run bot with command:
```bash
./kbot start
```
4. Enjoy!

List of used packages:
```
- github.com/spf13/cobra
- github.com/tucnak/telebot
```

