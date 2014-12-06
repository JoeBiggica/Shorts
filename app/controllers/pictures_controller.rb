class PicturesController < ApplicationController

	def index
		
	end

	def new
		@picture = Picture.new
		binding.pry
	end

end