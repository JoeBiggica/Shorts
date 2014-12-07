class ShortsController < ApplicationController

	def index

	end

	def create
		
	end

	def new
		@signature = Short.photo_sig('POST')
	end

end