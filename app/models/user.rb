class User < ActiveRecord::Base
	self.has_secure_password
	has_many :pictures


end