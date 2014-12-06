class Short < ActiveRecord::Base
	belongs_to :user

	def self.upload_photo_sig()
		path = '/v0/public/diogeneshamilton/shorts'
		method = 'POST'
		key = method + ':' + path 
		secret = 'TrgDfGw63t6hanZuJt7d2ANyq9Lee_8t' 
		Base64.encode64("#{OpenSSL::HMAC.digest('sha1', secret, key)}").gsub('+', '-').gsub('/', '_').gsub('=', '').strip()
	end


end