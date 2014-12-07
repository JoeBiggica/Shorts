class PicturesController < ApplicationController

	def index
		
	end

	def new
		@picture = Picture.new
	end

	def create
		hmac_signature = Short.photo_sig('GET', filename: params['original_filename'])
		image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{params['original_filename']}?hmac=#{hmac_signature}"
		@picture = Picture.create({image_url: image_url})
		render json: @picture 
	end

end