class HomeController < ApplicationController 

	def index
		if logged_in?
			redirect_to '/'
		else
	end

end