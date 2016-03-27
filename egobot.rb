##############################################################################
# REQUIRES
##############################################################################

require 'slack-notifier'
require 'twitter'
require 'hashie'
require 'yaml'
require 'active_support/core_ext/date/calculations'
require "active_support/core_ext/numeric/time"
require 'byebug'

Dir[File.dirname(__FILE__) + "/lib/**/*.rb"].each do |file|
  require file
end

##############################################################################
# CONFIG
# All files ending in config.yml are combined to form the config hash
##############################################################################

config = {}
Dir[File.dirname(__FILE__) + "/**/*config.yml"].each do |file|
  config.merge! YAML.load(File.open(file).read)
end
config = Hashie::Mash.new(config)

Slack::Client.setup config
Twit::Client.setup config

##############################################################################
# MAIN LOOP
# Fetch each account and post stats
##############################################################################

config.accounts.each { |account| Egobot.fetch_and_notify account }
