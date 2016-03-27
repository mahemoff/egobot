# 🔥  Egobot
Social stats on slack

Egobot posts recent Twitter stats to Slack. You can configure one or more
Twitter accounts to be fetched and posted simultaneously.

![Egobot screenshot](http://i.imgur.com/ybWRD63.jpg)

# 🔥  Setup

(This should later be a Ruby gem.)

1. `git clone git@github.com:mahemoff/egobot.git`
1. `bundle`
1. Edit config.yml. It includes instructions for making a Twitter app and a Slack webhook, both required for this.
1. Run egobot periodically on a cronjob. `bundle exec ruby ./egobot.rb`
