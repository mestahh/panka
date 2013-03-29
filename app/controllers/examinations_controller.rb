class ExaminationsController < ApplicationController

	def index
		if (params[:guest_id])
			@examinations = Examination.find_all_by_guest_id(params[:guest_id])
		else
			@examinations = Examination.find(:all)
		end
	end

	def new 
		@guest_id = params[:guest_id]
	end
	
	def show
	  @examination = Examination.find(params[:id]);
	end
	
	def create
		examination = Examination.new
		examination.anamnezis = params[:anamnezis]
		examination.status = params[:status]
		examination.treatment = params[:treatment]
		examination.charge = params[:charge]
		examination.guest_id = params[:guest_id]
		examination.save
		redirect_to guest_path(:id => params[:guest_id])
	end
	

end
