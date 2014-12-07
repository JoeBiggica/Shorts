class ShortsController < ApplicationController

	def index

	end

	def create
		binding.pry
	end

	def new
		@signature = Short.upload_photo_sig
	end

end