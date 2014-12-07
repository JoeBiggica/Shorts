class Short < ActiveRecord::Base
	belongs_to :user

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


end