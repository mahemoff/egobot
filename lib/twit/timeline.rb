module Twit
  class Timeline

    attr_reader :tweets, :total_rts, :total_favs

    def initialize(account, options={})

      @account = account
      @options = Hashie::Mash.new(options).reverse_merge(
        earliest: 2.days.ago,
        latest: 1.day.ago
      )

      @tweets ||= Twit::Client.client.user_timeline(@account, count: 200).select { |tweet|
        !tweet.retweet? && tweet.created_at > @options.earliest && tweet.created_at < @options.latest
      }

      @total_rts = @total_favs = 0
      @tweets.each { |tweet|
        @total_rts += tweet.retweet_count
        @total_favs += tweet.favorite_count
      }

    end

  end
end
