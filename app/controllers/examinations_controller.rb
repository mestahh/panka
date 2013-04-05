class ExaminationsController < ApplicationController
  before_filter :check_login
  
  
  def index
    if (params[:from_date])
      from = params[:from_date]
      to = params[:to_date]

      @examinations = Examination.where(["created_at < ? and created_at > ?", to, from])
    return
    end

    if (params[:guest_id])
      @examinations = Examination.find_all_by_guest_id(params[:guest_id])
    else
      @examinations = Examination.find(:all)
    end
  end

  def new
    @guest_id = params[:guest_id]
    @examination = Examination.new
  end

  def show
    @examination = Examination.find(params[:id]);
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path
    end
  end

  def create
    examination = Examination.new(params[:examination])

    if examination.save
      redirect_to guest_path(:id => examination.id)
    else
      redirect_to new_examination_path
    end

  end

  def destroy
    examination = Examination.find(params[:id])
    examination.delete
    redirect_to guest_path(:id => examination.guest.id)
  end

  def edit
    @examination = Examination.find(params[:id])
    if (@examination.guest.user_id != session[:user])
      redirect_to main_index_path
    end
  end

  def update
    exam = Examination.find(params[:id])

    if exam.update_attributes(params[:examination])
      redirect_to guest_path(:id => exam.guest.id)
    else
      redirect_to edit_examination_path(:id => params[:id])
    end
  end

end
