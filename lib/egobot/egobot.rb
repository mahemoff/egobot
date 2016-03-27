module Egobot

  HIGHLIGHTS_AMOUNT = 3

  def self.fetch_and_notify(account)

    timeline = Twit::Timeline.new(account)
    eligible_tweets = timeline.tweets.select { |tweet|
      tweet.retweet_count + tweet.favorite_count > 0
    }
    message = "@#{account} 🔁 #{timeline.total_rts} total retweets, ⭐ #{timeline.total_favs} total favs (#{eligible_tweets.count} of #{timeline.tweets.count} tweets)\n"
    message += \
      eligible_tweets
      .sort_by { |tweet| 2 * tweet.retweet_count + tweet.favorite_count }
      .reverse[0,HIGHLIGHTS_AMOUNT]
      .map { |tweet| Twit::Formatter.tweet_summary tweet}.join("  /  ")
    message += '/  ...' if eligible_tweets.count > HIGHLIGHTS_AMOUNT

    Slack::Client.client.ping message

  end

end
