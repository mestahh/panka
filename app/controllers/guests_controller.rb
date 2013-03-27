class GuestsController < ApplicationController

	def new
	
	end
	
	def create
		guest = Guest.new
		guest.save
		redirect_to main_index_path
	end
	
end
