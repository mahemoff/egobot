module Twit
  class Formatter

    def self.tweet_summary(tweet)
      link = "<a href='http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}'>#{tweet.created_at.to_formatted_s(:short)}</a>"
      stats = "#{tweet.retweet_count} #{tweet.favorite_count}"
      "#{link} #{stats}"
    end

  end
end
