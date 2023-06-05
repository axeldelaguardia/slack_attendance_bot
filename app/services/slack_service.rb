class SlackService
	def read_channel
		response = conn.post("/api/conversations.history") do |req|
			req.body = {channel: "C05B3FCP1JQ"}.to_json
		end
		JSON.parse(response.body, symbolize_names: true)
	end

	def check_for_messages
		x = read_channel
		x[:messages].each do |message|
			if message[:text].include?("Attendance Thread") && Trigger.find_by(ts: message[:ts]).nil?
				respond_to_thread(message[:ts])
			end
		end
	end

	def respond_to_thread(thread_id)
		response = conn.post("/api/chat.postMessage") do |req|
			req.body = {
				channel: "C05B3FCP1JQ",
				thread_ts: thread_id,
				text: "I am here and I am not using a script"
			}.to_json
		end
		Trigger.create(ts: thread_id)
	end

	def conn
		conn = Faraday.new(
			url: "https://slack.com",
			headers: {
				"Authorization": "Bearer #{ENV['SLACK_TOKEN']}",
				"Content-Type": "application/json"
			}
		)
	end
end