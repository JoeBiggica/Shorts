class PicturesController < ApplicationController
	require 'open-uri'

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

	def update
		image_from_web  = open(params[:url])


		image_name = params["picture_id"] + "_edited"
		signature = Short.photo_sig('POST')

		request = HTTParty.post("http://api.astra.io/v0/public/diogeneshamilton/shorts?hmac=#{signature}", :body => {type: 'image', name: 'image_name', file: image_from_web})
		

		hmac_signature = Short.photo_sig('GET', filename: image_name)
		image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{image_name}?hmac=#{hmac_signature}"
		binding.pry
		@picture = Picture.find(params["picture_id"])
		@picture.edited_image_url = image_url
		@picture.save
		render json: @picture 
	end

end