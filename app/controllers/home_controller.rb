class HomeController < ApplicationController 

	def index
		if logged_in?
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end
end