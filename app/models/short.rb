class Short < ActiveRecord::Base
	include Magick

	belongs_to :user
	has_many :pictures

	def self.photo_sig(method, filename: nil)

		path = '/v0/public/diogeneshamilton/shorts'
		if filename
			path = path + '/' + filename
		end
		method = method
		key = method + ':' + path 
		secret = 'TrgDfGw63t6hanZuJt7d2ANyq9Lee_8t' 
		Base64.encode64("#{OpenSSL::HMAC.digest('sha1', secret, key)}").gsub('+', '-').gsub('/', '_').gsub('=', '').strip()
	end

	def create_collage()
		pics = Picture.where(short_id:self.id).limit(9)
		images = []

		pics.each do |image|
			if image.edited_image_url
				images.push(image.edited_image_url)
			else
				images.push(image.image_url)
			end
		end
		length = images.length
		if length <= 2
			rows = 1
			cols = length 
		elsif length == 10 || length == 11
			rows = length/5
			cols = 5
		elsif length % 4 == 0 && length > 4 
			rows = length/4
			cols = 4
		elsif length % 3 == 0 
			rows = length/3
			cols = 3
		else
			rows = length / 2
			cols = 2
		end

		r_images = ImageList.new()


		puts rows
		puts cols
		1.upto(rows) do
			image_list = Magick::ImageList.new
			1.upto(cols) do
				image = Magick::Image.read(images.shift()).first
				if length > 1
					image.resize_to_fill!(200)
				end
				image.border!(3, 3, "#FFFFFF")

				image_list.push(image);
			end
			r_images.push(image_list.append(false));
		end
		name = "#{SecureRandom.uuid}_collage.jpg"
		s3 = AWS::S3.new(:access_key_id => ENV['S3_KEY'],:secret_access_key => ENV['S3_SECRET'])
		bucket = s3.buckets['shortsapp']

		my_blob = r_images.append(true).to_blob

		type = "image/jpeg"
		obj = bucket.objects.create(name,my_blob,{content_type:type,acl:"public_read"})
		url =  obj.public_url().to_s


		self.collage = url
		self.save
		self.collage
	end

	def send_message(phone_number)

		account_sid = 'ACad9e9341b5926f0c3a1954df501f0018'
		auth_token = 'b31d874d9f364a6c7a3d9b300b227cab'
		@client = Twilio::REST::Client.new account_sid, auth_token
		@client.account.messages.create({
			:from => '+15162104262', 
			:to => phone_number, 
			:body => "Hey Check out My New Short at http://shortshack.herokuapp.com/shorts/#{self.permalink}!",
			:media_url => self.collage
			})
	end


end