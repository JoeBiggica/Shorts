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
    @shorts = Short.where(user_id: session[:id]).order(updated_at: :desc)
  end

  def home
  	if logged_in?
    	@shorts = Short.where(user_id: session[:id]).order(updated_at: :desc)
  else
  	redirect_to '/login'
  end
  end

  def put
    binding.pry
  end

end