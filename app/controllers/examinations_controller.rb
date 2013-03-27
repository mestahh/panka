class ExaminationsController < ApplicationController

	def index
		@examinations = Examination.find(:all)
	end

	def new 
		@guest_id = params[:guest_id]
	end
	
	def create
		examination = Examination.new
		examination.anamnezis = params[:anamnezis]
		examination.status = params[:status]
		examination.treatment = params[:treatment]
		examination.charge = params[:charge]
		examination.save
		redirect_to guest_path(:id => params[:guest_id])
	end
	

end
