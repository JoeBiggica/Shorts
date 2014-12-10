class Picture < ActiveRecord::Base
	belongs_to :short
	has_many :image_versions

end