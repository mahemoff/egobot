module Twit
  class Client

    def self.setup(app_config)
      @twitter_rest_client ||= Twitter::REST::Client.new { |config|
        config.consumer_key        = app_config.twitter.consumer_key
        config.consumer_secret     = app_config.twitter.consumer_secret
        config.access_token        = app_config.twitter.access_token
        config.access_token_secret = app_config.twitter.access_token_secret
      }
    end

    def self.client
      @twitter_rest_client
    end

  end
end
