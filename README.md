### kbot
URL: http://t.me/bslobodeniuk_bot

- List of used packages:
```
- github.com/spf13/cobra
- github.com/tucnak/telebot
```
0. To build kbot:
- make build

To use this telegram bot on your environment:
1. Register telegram bot with the BotFather and get token.
2. Set env variable TELE_TOKEN with your token.:
```bash
read -s TELE_TOKEN # create variable with telegram token.
export TELE_TOKEN # set env variable, so it will be available for application.
```
3. Run bot with command:
```bash
./kbot start
```
4. Enjoy!


