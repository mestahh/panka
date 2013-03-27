class GuestsController < ApplicationController

	def new
	
	end
	
	def create
		guest = Guest.new
		guest.name = params[:name]
		guest.birth = params[:birth]
		guest.mother = params[:mother]
		guest.address = params[:address]
		guest.city = params[:city]
		guest.postal_code = params[:postal_code]
		guest.phone = params[:phone]
		guest.email = params[:email]

		guest.save
		redirect_to main_index_path
	end
	
	def show
		@guest = Guest.find(params[:id])
	end
	
	def edit
		@guest = Guest.find(params[:id])
	end
	
	def update
		guest = Guest.find(params[:id])
		guest.name = params[:name]
		guest.birth = params[:birth]
		guest.mother = params[:mother]
		guest.address = params[:address]
		guest.city = params[:city]
		guest.postal_code = params[:postal_code]
		guest.phone = params[:phone]
		guest.email = params[:email]

		guest.save
		redirect_to guest_path(:id => guest.id)
	end
	
	
end
