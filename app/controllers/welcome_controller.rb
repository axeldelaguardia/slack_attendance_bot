class WelcomeController < ApplicationController
	def index
		SlackService.new.check_for_messages
	end
end
