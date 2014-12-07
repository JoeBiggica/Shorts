class ShortsController < ApplicationController

	def index

	end

	def create
		picture_ids = params["picture_ids"]
		name = params["name"]

		@short = Short.create({name: name, permalink: SecureRandom.uuid, user_id: session[:id]})

		picture_ids.each do |picture_id|
			pic = Picture.find(picture_id)
			pic.short_id = @short.id
			pic.save
		end

		@short.create_collage()

	end

	def new
		@signature = Short.photo_sig('POST')
	end

	def show
		@short = Short.find_by(permalink: params["id"])
	end

	def send_short
		short = Short.find(params[:short_id])
		params[:numbers].each do |number|
			short.send_message(number)
		end
		render json: short


	end

	def share
		@short = Short.find(params[:id])
	end


end