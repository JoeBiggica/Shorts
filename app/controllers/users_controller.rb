class UsersController < ApplicationController

	def index
		@user = User.new
	end

	def create
		@user = User.create(email:params[:user][:email], password:params[:user][:password])
		session[:id] = @user.id
		redirect_to '/'
	end

  def show
    @user = User.find( session[:id] )
    @shorts = Short.where(user_id: session[:id])
  end

  def home
    @shorts = Short.where(user_id: session[:id])
  end

end