class PicturesController < ApplicationController

	def index
		
	end

	def new
		@picture = Picture.new
	end

	def create
		if params[:add]
			hmac_signature = Short.photo_sig('GET', filename: params['original_filename'])
			image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{params['original_filename']}?hmac=#{hmac_signature}"
			@picture = Picture.create({image_url: image_url,short_id:params[:short_id]})
		else
			hmac_signature = Short.photo_sig('GET', filename: params['original_filename'])
			image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{params['original_filename']}?hmac=#{hmac_signature}"
			@picture = Picture.create({image_url: image_url})
		end
		render json: @picture 
	end

end