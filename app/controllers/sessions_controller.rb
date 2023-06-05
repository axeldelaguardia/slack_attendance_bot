class SessionsController < ApplicationController
	def create
		require 'pry'; binding.pry
		auth = request.env['omniauth.auth']
	end
end
