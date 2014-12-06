class ShortsController < ApplicationController

	def index

	end

	def create
		binding.pry
	end

	def new
		@short = Short.new
		
		binding.pry
	end

end