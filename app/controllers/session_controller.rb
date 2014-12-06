class SessionController < ApplicationController

	def index
		if User.find_by(email:params[:email]).try(:authenticate, params[:password])
			session[:id] = User.find_by(email:params[:email]).id
			redirect_to '/'
		
		else
			redirect_to '/wrong_password'
		end

	end


end