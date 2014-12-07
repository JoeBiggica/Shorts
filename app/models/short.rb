class Short < ActiveRecord::Base
	include Magick
	belongs_to :user

	def self.upload_photo_sig()
		path = '/v0/public/diogeneshamilton/shorts'
		method = 'POST'
		key = method + ':' + path 
		secret = 'TrgDfGw63t6hanZuJt7d2ANyq9Lee_8t' 
		Base64.encode64("#{OpenSSL::HMAC.digest('sha1', secret, key)}").gsub('+', '-').gsub('/', '_').gsub('=', '').strip()
	end

	def send_message(phone_number)

		account_sid = 'ACad9e9341b5926f0c3a1954df501f0018'
		auth_token = 'b31d874d9f364a6c7a3d9b300b227cab'
		@client = Twilio::REST::Client.new account_sid, auth_token

		pics = Picture.where(short_id:self.id)
		images = []
		pics.each do |image|
			images.push(image.image_url)
		end


		length = images.length
		if length <= 2
			rows = 1
			cols = length 
		else
			rows = length/2
			cols = 2
		end
		r_images = ImageList.new()
		1.upto(rows) do
			image_list = Magick::ImageList.new
			1.upto(cols) do
				image = Magick::Image.read(images.shift()).first
				image_list.push(image);
			end
			r_images.push(image_list.append(false));
		end
		r_images.append(true).write('./public/collage.jpg')
	@client.account.messages.create({
		:from => '+15162104262', 
		:to => phone_number, 
		:body => 'Hey Check out My New Short!',
		:media_url => 'http://148c934f.ngrok.com/collage.jpg'
		})
end


end