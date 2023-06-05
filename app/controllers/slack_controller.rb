class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:events]

  def events
    payload = JSON.parse(request.body.read)

    if payload['type'] == 'event_callback' && payload['event']['type'] == 'message'
      process_message(payload['event'])
    end

    head :ok
  end

  private

  def process_message(event)
    # Check if the message contains the specific word you're interested in
    if event['text'].include?('attendance')
      reply_to_message(event['channel'], event['ts'])
    end
  end

  def reply_to_message(channel, ts)
    client = Slack::Web::Client.new(token: ENV['SLACK_OAUTH_ACCESS_TOKEN'])
    client.chat_postMessage(channel: channel, thread_ts: ts, text: 'Not here')
  end
end
