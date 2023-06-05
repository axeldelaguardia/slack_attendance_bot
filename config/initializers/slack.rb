# require "slack-ruby-client"

# Slack.configure do |config|
# 	config.token = 'xoxb-2329094327-5372162362325-RahHctiV8SmbbqwzZhZyU7WK'
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, ENV['SLACK_CLIENT_ID'], ENV['SLACK_CLIENT_SECRET'], scope: 'channels:history,chat:write,channels:read,groups:history'
end
