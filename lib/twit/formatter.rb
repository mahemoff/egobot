module Twit
  class Formatter

    def self.tweet_summary(tweet)
      stats = "%-6.6s    %-6.6s" % ["⭐ #{tweet.retweet_count}", "🔁 #{tweet.favorite_count}"]
      link = "<a href='http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id}'>#{tweet.created_at.to_formatted_s(:short)}</a>"
      "#{stats} #{link}"
    end

  end
end
