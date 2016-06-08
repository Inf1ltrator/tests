class SimplePagesController < ApplicationController

	def index
		@blank = Blank.all
	end

	def about
	end

end