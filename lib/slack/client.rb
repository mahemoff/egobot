module Slack
  class Client

    def self.setup(app_config)
      @slack_notifier ||= Slack::Notifier.new app_config.slack.webhook
    end

    def self.client
      @slack_notifier
    end

  end
end
