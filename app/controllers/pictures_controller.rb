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
			@short = Short.find(params[:short_id])
			@short.touch
			@picture = Picture.create({image_url: image_url,short_id:params[:short_id]})
			@short.create_collage
		else
			hmac_signature = Short.photo_sig('GET', filename: params['original_filename'])
			image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{params['original_filename']}?hmac=#{hmac_signature}"
			@picture = Picture.create({image_url: image_url})
		end
		render json: @picture 
	end
	def show
		@picture = Picture.find(params[:id])
		render json: @picture, :include => :image_versions
	end

	def update
		my_blob  = HTTParty.get(params[:url])


		name = SecureRandom.uuid + "_edited.jpg"
		# signature = Short.photo_sig('POST')
		# request = HTTParty.post("http://api.astra.io/v0/public/diogeneshamilton/shorts?hmac=#{signature}", :body => {file: image_from_web, type: 'image', name: 'image_name'})
		# hmac_signature = Short.photo_sig('GET', filename: image_name)
		# image_url = "http://cdn.astra.io/v0/public/diogeneshamilton/shorts/#{image_name}?hmac=#{hmac_signature}"

		# File.open("./public/#{image_name}", 'wb') {|f| f.write(res) }  
		s3 = AWS::S3.new(:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET'])
		bucket = s3.buckets['shortsapp']
		type = 'image'
		obj = bucket.objects.create(name,my_blob,{content_type:type,acl:"public_read"})
		url =  obj.public_url().to_s

		@picture = Picture.find(params["picture_id"])
		@picture.edited_image_url = url
		@picture.save
		render json: @picture 
	end

end