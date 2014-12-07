class ShortsController < ApplicationController

	def index

	end

	def create
		picture_ids = params["picture_ids"]
		name = params["name"]

		short = Short.create({name: name, permalink: SecureRandom.uuid, user_id: session[:id]})

		picture_ids.each do |picture_id|
			pic = Picture.find(picture_id)
			pic.short_id = short.id
			pic.save
		end


	end

	def new
		@signature = Short.photo_sig('POST')
	end

	def show
		@short = Short.where(permalink: params["permalink"])
	end


end