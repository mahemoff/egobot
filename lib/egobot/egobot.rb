module Egobot

  HIGHLIGHTS_AMOUNT = 3

  def self.fetch_and_notify(account)

    timeline = Twit::Timeline.new(account)
    message = "@#{account}'s stats: Total RTs: #{timeline.total_rts}, Total Favs: #{timeline.total_favs}.\n"
    eligible_tweets = timeline.tweets.select { |tweet|
      tweet.retweet_count + tweet.favorite_count > 0
    }
    message += \
      eligible_tweets
      .sort_by { |tweet| 2 * tweet.retweet_count + tweet.favorite_count }
      .reverse[0,HIGHLIGHTS_AMOUNT]
      .map { |tweet| Twit::Formatter.tweet_summary tweet}.join("\n")
    omitted_amount = eligible_tweets.size - HIGHLIGHTS_AMOUNT
    message += "\n(+ #{omitted_amount} more) ..." if omitted_amount > 0

    Slack::Client.client.ping message

  end

end
